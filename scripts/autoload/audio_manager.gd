## AudioManager
## 音频管理器
## 管理背景音乐、音效、语音等

extends Node

signal music_changed(track_name: String)
signal sfx_volume_changed(value: float)
signal music_volume_changed(value: float)

var master_bus_index: int = 0
var music_bus_index: int = 1
var sfx_bus_index: int = 2

var current_music: String = ""
var current_music_player: AudioStreamPlayer
var sfx_players: Array[AudioStreamPlayer] = []
var ambient_player: AudioStreamPlayer

const MAX_SFX_PLAYERS: int = 8

var music_volume: float = 0.8:
    set(value):
        music_volume = clamp(value, 0.0, 1.0)
        AudioServer.set_bus_volume_db(music_bus_index, linear_to_db(music_volume))
        music_volume_changed.emit(music_volume)

var sfx_volume: float = 0.8:
    set(value):
        sfx_volume = clamp(value, 0.0, 1.0)
        AudioServer.set_bus_volume_db(sfx_bus_index, linear_to_db(sfx_volume))
        sfx_volume_changed.emit(sfx_volume)


func _ready() -> void:
    process_mode = Node.PROCESS_MODE_ALWAYS
    _setup_audio_buses()
    _create_sfx_players()


func _setup_audio_buses() -> void:
    for i in range(AudioServer.bus_count):
        var bus_name := AudioServer.get_bus_name(i)
        match bus_name:
            "Master":
                master_bus_index = i
            "Music":
                music_bus_index = i
            "SFX":
                sfx_bus_index = i


func _create_sfx_players() -> void:
    for i in MAX_SFX_PLAYERS:
        var player := AudioStreamPlayer.new()
        player.bus = "SFX"
        player.process_mode = Node.PROCESS_MODE_PAUSED
        add_child(player)
        sfx_players.append(player)


func play_music(path: String, fade_duration: float = 1.0) -> void:
    if current_music == path:
        return

    var stream := load(path) as AudioStream
    if not stream:
        push_warning("AudioManager: Failed to load music: " + path)
        return

    if current_music_player and current_music_player.playing:
        _fade_out(current_music_player, fade_duration)

    current_music_player = AudioStreamPlayer.new()
    current_music_player.stream = stream
    current_music_player.bus = "Music"
    current_music_player.volume_db = -80.0
    add_child(current_music_player)
    current_music_player.play()

    _fade_in(current_music_player, fade_duration)
    current_music = path
    music_changed.emit(path)


func stop_music(fade_duration: float = 1.0) -> void:
    if current_music_player:
        _fade_out(current_music_player, fade_duration)
        await get_tree().create_timer(fade_duration).timeout
        current_music_player.queue_free()
        current_music_player = null
    current_music = ""


func _fade_in(player: AudioStreamPlayer, duration: float) -> void:
    var tween := create_tween()
    tween.tween_property(player, "volume_db", 0.0, duration)


func _fade_out(player: AudioStreamPlayer, duration: float) -> void:
    var tween := create_tween()
    tween.tween_property(player, "volume_db", -80.0, duration)


func play_sfx(path: String, volume_db: float = 0.0, pitch_scale: float = 1.0) -> void:
    var stream := load(path) as AudioStream
    if not stream:
        return

    var player := _get_available_sfx_player()
    if not player:
        return

    player.stream = stream
    player.volume_db = volume_db
    player.pitch_scale = pitch_scale
    player.play()


func _get_available_sfx_player() -> AudioStreamPlayer:
    for player in sfx_players:
        if not player.playing:
            return player
    return sfx_players[0]


func play_spatial_sfx(path: String, position: Vector2, volume_db: float = 0.0) -> void:
    var stream := load(path) as AudioStream
    if not stream:
        return

    var player := AudioStreamPlayer2D.new()
    player.stream = stream
    player.bus = "SFX"
    player.volume_db = volume_db
    player.position = position
    add_child(player)
    player.play()
    player.finished.connect(player.queue_free)


func play_ambient(path: String) -> void:
    if ambient_player:
        ambient_player.queue_free()

    var stream := load(path) as AudioStream
    if not stream:
        return

    ambient_player = AudioStreamPlayer.new()
    ambient_player.stream = stream
    ambient_player.bus = "Music"
    ambient_player.volume_db = -20.0
    ambient_player.loop = true
    add_child(ambient_player)
    ambient_player.play()


func stop_ambient() -> void:
    if ambient_player:
        ambient_player.queue_free()
        ambient_player = null


func set_master_volume(value: float) -> void:
    AudioServer.set_bus_volume_db(master_bus_index, linear_to_db(clamp(value, 0.0, 1.0)))


func mute_all() -> void:
    AudioServer.set_bus_mute(master_bus_index, true)


func unmute_all() -> void:
    AudioServer.set_bus_mute(master_bus_index, false)


func pause_audio() -> void:
    if current_music_player:
        current_music_player.process_mode = Node.PROCESS_MODE_PAUSED
    for player in sfx_players:
        player.process_mode = Node.PROCESS_MODE_PAUSED
    if ambient_player:
        ambient_player.process_mode = Node.PROCESS_MODE_PAUSED


func resume_audio() -> void:
    if current_music_player:
        current_music_player.process_mode = Node.PROCESS_MODE_ALWAYS
    for player in sfx_players:
        player.process_mode = Node.PROCESS_MODE_PAUSED
    if ambient_player:
        ambient_player.process_mode = Node.PROCESS_MODE_ALWAYS


func play_skill_sfx(skill_key: String) -> void:
    match skill_key:
        "Q":
            play_sfx("res://assets/audio/sfx/combat/skill_echo_wave.ogg")
        "W":
            play_sfx("res://assets/audio/sfx/combat/skill_sonar.ogg")
        "E":
            play_sfx("res://assets/audio/sfx/combat/skill_silence.ogg")
        "R":
            play_sfx("res://assets/audio/sfx/combat/skill_ultimate.ogg")


func play_ui_sfx(sfx_name: String) -> void:
    match sfx_name:
        "click":
            play_sfx("res://assets/audio/sfx/ui/click.ogg")
        "hover":
            play_sfx("res://assets/audio/sfx/ui/hover.ogg")
        "open":
            play_sfx("res://assets/audio/sfx/ui/menu_open.ogg")
        "close":
            play_sfx("res://assets/audio/sfx/ui/menu_close.ogg")
        "purchase":
            play_sfx("res://assets/audio/sfx/ui/purchase.ogg")
        "error":
            play_sfx("res://assets/audio/sfx/ui/error.ogg")


func play_combat_sfx(sfx_name: String) -> void:
    match sfx_name:
        "hit":
            play_sfx("res://assets/audio/sfx/combat/hit.ogg")
        "critical":
            play_sfx("res://assets/audio/sfx/combat/critical.ogg")
        "dodge":
            play_sfx("res://assets/audio/sfx/combat/dodge.ogg")
        "death":
            play_sfx("res://assets/audio/sfx/combat/death.ogg")
        "enemy_hit":
            play_sfx("res://assets/audio/sfx/combat/enemy_hit.ogg")
        "boss_damage":
            play_sfx("res://assets/audio/sfx/combat/boss_damage.ogg")


func play_zone_music(zone_name: String) -> void:
    match zone_name.to_lower():
        "forest":
            play_music("res://assets/audio/music/forest_theme.ogg")
        "lava":
            play_music("res://assets/audio/music/lava_theme.ogg")
        "deepsea":
            play_music("res://assets/audio/music/deepsea_theme.ogg")
        "bone":
            play_music("res://assets/audio/music/bone_theme.ogg")
        "abyss":
            play_music("res://assets/audio/music/abyss_theme.ogg")
        _:
            play_music("res://assets/audio/music/forest_theme.ogg")
