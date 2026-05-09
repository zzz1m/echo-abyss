extends Node2D
class_name Game

signal game_started
signal game_paused
signal game_resumed
signal game_over
signal victory

@export var current_zone: Zone = null
@export var current_room_index: int = 0

var player: Player
var is_paused: bool = false
var is_game_over: bool = false


func _ready() -> void:
    _setup_player()


func _setup_player() -> void:
    var player_scene = preload("res://scenes/characters/player/player.tscn")
    player = player_scene.instantiate()
    add_child(player)
    player.position = Vector2(400, 300)


func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("pause"):
        toggle_pause()


func toggle_pause() -> void:
    is_paused = !is_paused

    if is_paused:
        get_tree().paused = true
        game_paused.emit()
        _show_pause_menu()
    else:
        get_tree().paused = false
        game_resumed.emit()


func _show_pause_menu() -> void:
    var pause_scene = load("res://scenes/ui/menus/pause_menu.tscn")
    var pause_menu = pause_scene.instantiate()
    get_tree().current_scene.add_child(pause_menu)


func start_game() -> void:
    game_started.emit()


func trigger_game_over() -> void:
    is_game_over = true
    get_tree().paused = true
    game_over.emit()


func trigger_victory() -> void:
    is_game_over = true
    get_tree().paused = true
    victory.emit()


func get_player() -> Player:
    return player
