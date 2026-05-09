extends Node2D
class_name SkillEffect

@export var skill_name: String = ""
@export var effect_type: String = "projectile"
@export var duration: float = 2.0
@export var damage: int = 0
@export var area_radius: float = 100.0

signal effect_finished
signal hit_confirmed(target: Node)

var is_active: bool = true
var targets_hit: Array = []


func _ready() -> void:
    add_to_group("skill_effects")


func _process(delta: float) -> void:
    if not is_active:
        return

    duration -= delta
    if duration <= 0:
        _on_effect_finished()


func _on_effect_finished() -> void:
    is_active = false
    effect_finished.emit()
    queue_free()


func _on_area_entered(area: Area2D) -> void:
    if area in targets_hit:
        return

    targets_hit.append(area)
    hit_confirmed.emit(area)

    if area.has_method("take_damage") and damage > 0:
        area.take_damage(damage)


func _on_body_entered(body: Node) -> void:
    if body in targets_hit:
        return

    targets_hit.append(body)
    hit_confirmed.emit(body)

    if body.has_method("take_damage") and damage > 0:
        body.take_damage(damage)
