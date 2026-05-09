extends Node
class_name DialogSystem

signal dialogue_started
signal dialogue_finished
signal line_displayed(line: String)

var is_active: bool = false
var current_lines: Array[String] = []
var current_line_index: int = 0
var current_npc: Node = null


func _ready() -> void:
    add_to_group("dialog_system")


func start_dialogue(lines: Array[String], npc: Node = null) -> void:
    if is_active:
        return

    is_active = true
    current_lines = lines
    current_line_index = 0
    current_npc = npc

    dialogue_started.emit()
    _show_dialogue_box()


func advance_dialogue() -> void:
    if not is_active:
        return

    current_line_index += 1

    if current_line_index >= current_lines.size():
        end_dialogue()
    else:
        _update_display()


func end_dialogue() -> void:
    is_active = false
    current_lines.clear()
    current_line_index = 0

    if current_npc and current_npc.has_signal("dialogue_finished"):
        current_npc.dialogue_finished.emit()

    dialogue_finished.emit()
    _hide_dialogue_box()


func _show_dialogue_box() -> void:
    pass


func _hide_dialogue_box() -> void:
    pass


func _update_display() -> void:
    if current_line_index < current_lines.size():
        line_displayed.emit(current_lines[current_line_index])


func is_dialogue_active() -> bool:
    return is_active


func get_current_line() -> String:
    if current_line_index < current_lines.size():
        return current_lines[current_line_index]
    return ""
