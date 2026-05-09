extends Control
class_name SaveLoadUI

signal save_completed(slot: int)
signal load_completed(slot: int)
signal ui_closed

@onready var save_slots: VBoxContainer = $Container/SaveSlots
@onready var close_button: Button = $Container/ButtonContainer/CloseButton

enum UIMode {
    SAVE,
    LOAD,
}

var current_mode: UIMode = UIMode.SAVE
var slot_buttons: Array[Button] = []


func _ready() -> void:
    _setup_ui()
    _connect_signals()
    _refresh_save_slots()


func _setup_ui() -> void:
    for child in save_slots.get_children():
        if child is Button:
            slot_buttons.append(child)


func _connect_signals() -> void:
    for i in range(slot_buttons.size()):
        slot_buttons[i].pressed.connect(_on_slot_pressed.bind(i + 1))

    close_button.pressed.connect(_on_close_pressed)


func setup_mode(mode: UIMode) -> void:
    current_mode = mode
    match mode:
        UIMode.SAVE:
            $Container/TitleLabel.text = "保存游戏"
        UIMode.LOAD:
            $Container/TitleLabel.text = "加载游戏"


func _refresh_save_slots() -> void:
    for i in range(slot_buttons.size()):
        var has_save = SaveManager.has_save(i + 1)

        if has_save:
            var save_data = SaveManager.load_save(i + 1)
            var zone = save_data.get("progression", {}).get("current_zone", "未知")
            slot_buttons[i].text = "存档槽位 %d - %s" % [i + 1, zone]
        else:
            slot_buttons[i].text = "存档槽位 %d - 空" % (i + 1)

        slot_buttons[i].disabled = (current_mode == UIMode.LOAD and not has_save)


func _on_slot_pressed(slot: int) -> void:
    match current_mode:
        UIMode.SAVE:
            _save_game(slot)
        UIMode.LOAD:
            _load_game(slot)


func _save_game(slot: int) -> void:
    var success = SaveManager.save_game(slot)
    if success:
        save_completed.emit(slot)
        _refresh_save_slots()
    else:
        print("保存失败！")


func _load_game(slot: int) -> void:
    var save_data = SaveManager.load_save(slot)
    if save_data.is_empty():
        print("加载失败！")
        return

    load_completed.emit(slot)
    _apply_save_data(save_data)
    queue_free()


func _apply_save_data(data: Dictionary) -> void:
    var game = get_tree().current_scene
    if game.has_method("load_game_data"):
        game.load_game_data(data)


func _on_close_pressed() -> void:
    ui_closed.emit()
    queue_free()
