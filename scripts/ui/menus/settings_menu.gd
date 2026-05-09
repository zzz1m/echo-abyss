extends Control
class_name SettingsMenu

signal settings_applied
signal settings_closed

@onready var music_slider: HSlider = $Container/SettingsContainer/MusicRow/MusicSlider
@onready var sfx_slider: HSlider = $Container/SettingsContainer/SFXRow/SFXSlider
@onready var fullscreen_check: CheckButton = $Container/SettingsContainer/FullscreenRow/FullscreenCheck
@onready var apply_button: Button = $Container/ButtonContainer/ApplyButton
@onready var close_button: Button = $Container/ButtonContainer/CloseButton

var original_music_volume: float
var original_sfx_volume: float
var original_fullscreen: bool


func _ready() -> void:
    _load_current_settings()
    _connect_signals()
    original_music_volume = music_slider.value
    original_sfx_volume = sfx_slider.value
    original_fullscreen = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN


func _load_current_settings() -> void:
    if AudioManager:
        music_slider.value = AudioManager.music_volume
        sfx_slider.value = AudioManager.sfx_volume

    fullscreen_check.button_pressed = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN


func _connect_signals() -> void:
    apply_button.pressed.connect(_on_apply_pressed)
    close_button.pressed.connect(_on_close_pressed)


func _on_apply_pressed() -> void:
    _apply_settings()
    settings_applied.emit()


func _on_close_pressed() -> void:
    if music_slider.value != original_music_volume or \
       sfx_slider.value != original_sfx_volume or \
       fullscreen_check.button_pressed != original_fullscreen:

        music_slider.value = original_music_volume
        sfx_slider.value = original_sfx_volume
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if original_fullscreen else DisplayServer.WINDOW_MODE_WINDOWED)

    settings_closed.emit()
    queue_free()


func _apply_settings() -> void:
    if AudioManager:
        AudioManager.music_volume = music_slider.value
        AudioManager.sfx_volume = sfx_slider.value

    if fullscreen_check.button_pressed:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
    else:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

    SaveManager.save_settings({
        "music_volume": music_slider.value,
        "sfx_volume": sfx_slider.value,
        "fullscreen": fullscreen_check.button_pressed,
    })
