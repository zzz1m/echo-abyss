## GameManager
## 游戏主状态管理器
## 管理游戏状态、暂停、场景切换等

extends Node

signal game_paused
signal game_resumed
signal game_started
signal game_ended
signal game_over
signal level_changed(zone_id: String, room_id: int)

enum GameState {
    MENU,
    PLAYING,
    PAUSED,
    GAME_OVER,
    VICTORY,
}

var current_state: GameState = GameState.MENU
var previous_state: GameState = GameState.MENU

var current_zone: String = ""
var current_room: int = 0

var is_paused: bool = false:
    set(value):
        is_paused = value
        get_tree().paused = value
        if value:
            game_paused.emit()
        else:
            game_resumed.emit()

var game_time: float = 0.0
var pause_time: float = 0.0


func _ready() -> void:
    process_mode = Node.PROCESS_MODE_ALWAYS


func _process(delta: float) -> void:
    if current_state == GameState.PLAYING and not is_paused:
        game_time += delta


func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("pause"):
        toggle_pause()


func toggle_pause() -> void:
    if current_state == GameState.PLAYING:
        if is_paused:
            resume_game()
        else:
            pause_game()


func pause_game() -> void:
    if current_state != GameState.PLAYING:
        return

    previous_state = current_state
    current_state = GameState.PAUSED
    is_paused = true


func resume_game() -> void:
    if current_state != GameState.PAUSED:
        return

    current_state = previous_state
    is_paused = false


func start_game() -> void:
    current_state = GameState.PLAYING
    game_time = 0.0
    pause_time = 0.0
    is_paused = false
    game_started.emit()


func end_game() -> void:
    current_state = GameState.GAME_OVER
    is_paused = true
    game_over.emit()


func victory() -> void:
    current_state = GameState.VICTORY
    is_paused = true
    victory.emit()


func change_level(zone_id: String, room_id: int) -> void:
    current_zone = zone_id
    current_room = room_id
    level_changed.emit(zone_id, room_id)


func reset_game() -> void:
    current_state = GameState.MENU
    current_zone = ""
    current_room = 0
    game_time = 0.0
    is_paused = false


func is_playing() -> bool:
    return current_state == GameState.PLAYING and not is_paused


func is_game_over() -> bool:
    return current_state == GameState.GAME_OVER


func is_victory() -> bool:
    return current_state == GameState.VICTORY


func get_game_time_formatted() -> String:
    var minutes := int(game_time) / 60
    var seconds := int(game_time) % 60
    return "%02d:%02d" % [minutes, seconds]
