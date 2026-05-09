extends Node
class_name Skill

signal skill_used(skill_name: String)
signal skill_ready
signal skill_cooldown_started(cooldown: float)
signal skill_cooldown_finished


@export var skill_name: String = "Skill"
@export var description: String = ""
@export var icon: Texture2D

@export var energy_cost: float = 20.0
@export var cooldown: float = 3.0
@export var key: String = "Q"

var current_cooldown: float = 0.0
var is_ready: bool = true


func _ready() -> void:
    current_cooldown = 0.0
    is_ready = true


func _process(delta: float) -> void:
    if current_cooldown > 0:
        current_cooldown -= delta
        if current_cooldown <= 0:
            current_cooldown = 0.0
            is_ready = true
            skill_ready.emit()


func can_use(caster: Node) -> bool:
    return is_ready and caster.energy >= energy_cost


func use(caster: Node) -> bool:
    if not can_use(caster):
        return false

    caster.energy -= energy_cost
    current_cooldown = cooldown
    is_ready = false
    skill_used.emit(skill_name)
    skill_cooldown_started.emit(cooldown)

    _execute_skill(caster)
    return true


func _execute_skill(caster: Node) -> void:
    pass


func get_cooldown_percent() -> float:
    if cooldown <= 0:
        return 1.0
    return 1.0 - (current_cooldown / cooldown)
