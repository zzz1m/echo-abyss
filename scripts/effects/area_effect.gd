extends SkillEffect

@export var pull_strength: float = 100.0
@export var damage_per_tick: float = 10.0
@export var slow_amount: float = 0.3
@export var tick_rate: float = 1.0

var tick_timer: float = 0.0
var affected_entities: Array = []


func _ready() -> void:
    super._ready()
    effect_type = "area"


func _physics_process(delta: float) -> void:
    super._physics_process(delta)

    if not is_active:
        return

    tick_timer += delta
    if tick_timer >= tick_rate:
        tick_timer = 0.0
        _apply_tick_damage()


func _apply_tick_damage() -> void:
    for entity in affected_entities:
        if is_instance_valid(entity):
            if entity.has_method("take_damage"):
                entity.take_damage(int(damage_per_tick))


func _on_area_entered(area: Area2D) -> void:
    super._on_area_entered(area)
    if area not in affected_entities:
        affected_entities.append(area)

        if area.has_method("apply_slow"):
            area.apply_slow(slow_amount)


func _on_area_exited(area: Area2D) -> void:
    if area in affected_entities:
        affected_entities.erase(area)

        if area.has_method("remove_slow"):
            area.remove_slow(slow_amount)


func _on_body_entered(body: Node) -> void:
    super._on_body_entered(body)
    if body not in affected_entities:
        affected_entities.append(body)

        if body.has_method("apply_slow"):
            body.apply_slow(slow_amount)


func _on_body_exited(body: Node) -> void:
    if body in affected_entities:
        affected_entities.erase(body)

        if body.has_method("remove_slow"):
            body.remove_slow(slow_amount)
