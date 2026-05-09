extends Node
class_name StateMachine

signal state_changed(old_state_name: String, new_state_name: String)

@export var initial_state: State

var current_state: State
var states: Dictionary = {}


func _ready() -> void:
    for child in get_children():
        if child is State:
            states[child.name.to_lower()] = child
            child.state_machine = self
            child.character = get_parent()

    if initial_state:
        current_state = initial_state
        current_state.enter()


func _physics_process(delta: float) -> void:
    if current_state:
        current_state.physics_process(delta)


func _process(delta: float) -> void:
    if current_state:
        current_state.process(delta)


func _unhandled_input(event: InputEvent) -> void:
    if current_state:
        current_state.handle_input(event)


func set_state(state_name: String) -> void:
    var new_state = states.get(state_name.to_lower())
    if new_state == null or new_state == current_state:
        return

    var old_state = current_state
    var old_state_name = old_state.name if old_state else ""

    current_state.exit()
    current_state = new_state
    current_state.enter()
    state_changed.emit(old_state_name, new_state.name)
