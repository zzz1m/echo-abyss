extends SkillEffect

@export var projectile_speed: float = 400.0
@export var pierce_count: int = 0
@export var homing: bool = false
@export var homing_strength: float = 0.0

var direction: Vector2 = Vector2.RIGHT
var current_pierce: int = 0
var target_node: Node = null


func _ready() -> void:
    super._ready()
    effect_type = "projectile"


func _physics_process(delta: float) -> void:
    super._physics_process(delta)

    if not is_active:
        return

    if homing and target_node:
        var target_dir = (target_node.global_position - global_position).normalized()
        direction = direction.lerp(target_dir, homing_strength * delta).normalized()

    position += direction * projectile_speed * delta


func set_direction(new_direction: Vector2) -> void:
    direction = new_direction.normalized()
    rotation = direction.angle()


func set_target(target: Node) -> void:
    target_node = target
    if target_node:
        homing = true


func _on_body_entered(body: Node) -> void:
    super._on_body_entered(body)

    if body.is_in_group("enemy"):
        current_pierce += 1
        if current_pierce > pierce_count:
            _on_effect_finished()
