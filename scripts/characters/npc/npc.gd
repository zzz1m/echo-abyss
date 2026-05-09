extends Area2D
class_name NPC

signal interacted(npc: NPC)
signal dialogue_started(npc_name: String)
signal dialogue_ended

@export var npc_name: String = "NPC"
@export var display_name: String = "商人"
@export var dialogue_lines: Array[String] = ["你好，旅行者。"]

var is_interactable: bool = true
var has_interacted: bool = false


func _ready() -> void:
    add_to_group("npc")
    area_entered.connect(_on_area_entered)
    area_exited.connect(_on_area_exited)


func _on_area_entered(area: Area2D) -> void:
    if area.is_in_group("player"):
        _show_interaction_prompt()


func _on_area_exited(area: Area2D) -> void:
    if area.is_in_group("player"):
        _hide_interaction_prompt()


func interact() -> void:
    if not is_interactable:
        return

    has_interacted = true
    interacted.emit(self)
    dialogue_started.emit(npc_name)
    _start_dialogue()


func _start_dialogue() -> void:
    DialogSystem.start_dialogue(dialogue_lines, self)


func _on_dialogue_finished() -> void:
    dialogue_ended.emit()


func _show_interaction_prompt() -> void:
    pass


func _hide_interaction_prompt() -> void:
    pass


func get_display_name() -> String:
    return display_name
