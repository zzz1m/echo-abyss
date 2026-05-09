extends Node
class_name LevelManager

signal level_started(zone_name: String)
signal room_entered(room_data: Dictionary)
signal room_cleared
signal level_completed(zone_name: String)

@export var current_zone: String = "forest"
@export var rooms_per_zone: int = 10

var level_generator: LevelGenerator
var current_room_data: Dictionary = {}
var is_in_combat: bool = false
var enemies_remaining: int = 0


func _ready() -> void:
    _setup_level_generator()


func _setup_level_generator() -> void:
    level_generator = LevelGenerator.new()
    add_child(level_generator)
    level_generator.room_generated.connect(_on_room_generated)
    level_generator.level_completed.connect(_on_level_completed)


func start_level(zone: String) -> void:
    current_zone = zone
    level_generator.generate_level(_zone_string_to_type(zone), rooms_per_zone)
    level_started.emit(zone)


func _zone_string_to_type(zone: String) -> LevelGenerator.ZoneType:
    match zone.to_lower():
        "forest":
            return LevelGenerator.ZoneType.FOREST
        "lava":
            return LevelGenerator.ZoneType.LAVA
        "deepsea":
            return LevelGenerator.ZoneType.DEEPSEA
        "bone":
            return LevelGenerator.ZoneType.BONE
        "abyss":
            return LevelGenerator.ZoneType.ABYSS
        _:
            return LevelGenerator.ZoneType.FOREST


func load_next_room() -> void:
    current_room_data = level_generator.get_next_room()
    room_entered.emit(current_room_data)

    _setup_room()


func _setup_room() -> void:
    var room_type = current_room_data.get("room_type")

    match room_type:
        LevelGenerator.RoomType.COMBAT:
            _setup_combat_room()
        LevelGenerator.RoomType.BOSS:
            _setup_boss_room()
        LevelGenerator.RoomType.SHOP:
            _setup_shop_room()
        LevelGenerator.RoomType.EVENT:
            _setup_event_room()
        LevelGenerator.RoomType.REST:
            _setup_rest_room()


func _setup_combat_room() -> void:
    is_in_combat = true
    enemies_remaining = current_room_data.get("enemies", []).size()
    _spawn_enemies(current_room_data.get("enemies", []))


func _setup_boss_room() -> void:
    is_in_combat = true
    enemies_remaining = 1
    _spawn_boss(current_room_data.get("enemies", []))


func _spawn_enemies(enemy_list: Array) -> void:
    for enemy_data in enemy_list:
        var enemy_scene = _get_enemy_scene(enemy_data.get("type", "bat"))
        if enemy_scene:
            var enemy = enemy_scene.instantiate()
            enemy.global_position = enemy_data.get("position", Vector2(400, 300))
            enemy.died.connect(_on_enemy_died)
            get_parent().add_child(enemy)


func _spawn_boss(boss_list: Array) -> void:
    for boss_data in boss_list:
        var boss_scene = _get_boss_scene(boss_data.get("type", "boss_warden"))
        if boss_scene:
            var boss = boss_scene.instantiate()
            boss.global_position = boss_data.get("position", Vector2(400, 300))
            boss.died.connect(_on_boss_died)
            get_parent().add_child(boss)


func _get_enemy_scene(enemy_type: String) -> PackedScene:
    match enemy_type:
        "bat":
            return load("res://scenes/enemies/common/enemy_bat.tscn")
        "crawler":
            return load("res://scenes/enemies/common/enemy_crawler.tscn")
        "specter":
            return load("res://scenes/enemies/common/enemy_specter.tscn")
        _:
            return load("res://scenes/enemies/common/enemy_bat.tscn")


func _get_boss_scene(boss_type: String) -> PackedScene:
    match boss_type:
        "boss_warden":
            return load("res://scenes/enemies/bosses/boss_warden.tscn")
        "boss_soundwave":
            return load("res://scenes/enemies/bosses/boss_soundwave.tscn")
        "boss_void":
            return load("res://scenes/enemies/bosses/boss_void.tscn")
        _:
            return load("res://scenes/enemies/bosses/boss_warden.tscn")


func _setup_shop_room() -> void:
    is_in_combat = false
    _show_shop_ui()


func _setup_event_room() -> void:
    is_in_combat = false


func _setup_rest_room() -> void:
    is_in_combat = false
    var player = get_tree().get_first_node_in_group("player")
    if player:
        player.heal(player.max_health)


func _on_enemy_died() -> void:
    enemies_remaining -= 1
    _check_room_clear()


func _on_boss_died() -> void:
    enemies_remaining = 0
    room_cleared.emit()

    if level_generator.is_level_complete():
        level_completed.emit(current_zone)


func _check_room_clear() -> void:
    if enemies_remaining <= 0:
        is_in_combat = false
        room_cleared.emit()

        if level_generator.is_level_complete():
            level_completed.emit(current_zone)
        else:
            _prompt_next_room()


func _prompt_next_room() -> void:
    pass


func _show_shop_ui() -> void:
    pass


func _on_room_generated(room_index: int) -> void:
    pass


func _on_level_completed() -> void:
    level_completed.emit(current_zone)
