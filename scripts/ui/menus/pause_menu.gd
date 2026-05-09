extends Control
class_name PauseMenu

signal resume_game
signal open_settings
signal quit_to_menu
signal restart_game

@onready var pause_container: VBoxContainer = $PauseContainer
@onready var resume_button: Button = $PauseContainer/ResumeButton
@onready var settings_button: Button = $PauseContainer/SettingsButton
@onready var restart_button: Button = $PauseContainer/RestartButton
@onready var quit_button: Button = $PauseContainer/QuitButton


func _ready() -> void:
    _setup_ui()
    _connect_signals()
    _show_pause_menu()


func _setup_ui() -> void:
    resume_button.text = "继续游戏"
    settings_button.text = "设置"
    restart_button.text = "重新开始"
    quit_button.text = "返回主菜单"


func _connect_signals() -> void:
    resume_button.pressed.connect(_on_resume_pressed)
    settings_button.pressed.connect(_on_settings_pressed)
    restart_button.pressed.connect(_on_restart_pressed)
    quit_button.pressed.connect(_on_quit_pressed)


func _on_resume_pressed() -> void:
    resume_game.emit()
    queue_free()


func _on_settings_pressed() -> void:
    open_settings.emit()


func _on_restart_pressed() -> void:
    restart_game.emit()
    get_tree().paused = false
    get_tree().change_scene_to_file("res://scenes/core/game.tscn")


func _on_quit_pressed() -> void:
    quit_to_menu.emit()
    get_tree().paused = false
    get_tree().change_scene_to_file("res://scenes/ui/menus/main_menu.tscn")


func _show_pause_menu() -> void:
    pause_container.visible = true
