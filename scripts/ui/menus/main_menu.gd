extends Control
class_name MainMenu

signal start_game
signal open_settings
signal quit_game

@onready var title_label: Label = $VBoxContainer/TitleLabel
@onready var start_button: Button = $VBoxContainer/ButtonContainer/StartButton
@onready var settings_button: Button = $VBoxContainer/ButtonContainer/SettingsButton
@onready var quit_button: Button = $VBoxContainer/ButtonContainer/QuitButton
@onready var version_label: Label = $VersionLabel

const GAME_TITLE := "回响深渊"
const GAME_VERSION := "v0.1.0"


func _ready() -> void:
    _setup_ui()
    _connect_signals()


func _setup_ui() -> void:
    title_label.text = GAME_TITLE
    version_label.text = GAME_VERSION


func _connect_signals() -> void:
    start_button.pressed.connect(_on_start_pressed)
    settings_button.pressed.connect(_on_settings_pressed)
    quit_button.pressed.connect(_on_quit_pressed)


func _on_start_pressed() -> void:
    start_game.emit()
    _transition_to_game()


func _on_settings_pressed() -> void:
    open_settings.emit()


func _on_quit_pressed() -> void:
    quit_game.emit()
    get_tree().quit()


func _transition_to_game() -> void:
    get_tree().change_scene_to_file("res://scenes/core/game.tscn")
