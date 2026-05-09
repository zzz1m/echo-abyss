extends Area2D

signal hit_confirmed(target: Node)

@export var damage: int = 10
@export var damage_type: int = 0
@export var knockback_force: float = 100.0
@export var lifetime: float = 0.0

var direction: Vector2 = Vector2.RIGHT
var speed: float = 300.0
var is_active: bool = true


func _ready() -> void:
    area_entered.connect(_on_area_entered)
    body_entered.connect(_on_body_entered)


func initialize(
    new_damage: int,
    new_direction: Vector2,
    new_speed: float = 300.0,
    new_damage_type: int = 0
) -> void:
    damage = new_damage
    direction = new_direction
    speed = new_speed
    damage_type = new_damage_type

    rotation = direction.angle()


func _physics_process(delta: float) -> void:
    if not is_active:
        return

    position += direction * speed * delta

    if lifetime > 0:
        lifetime -= delta
        if lifetime <= 0:
            _expire()


func _on_area_entered(area: Area2D) -> void:
    _handle_hit(area)


func _on_body_entered(body: Node) -> void:
    _handle_hit(body)


func _handle_hit(target: Node) -> void:
    if target == self or target.is_in_group("projectile"):
        return

    if target.has_method("take_damage"):
        target.take_damage(damage, damage_type)

    if target.has_method("apply_knockback") and knockback_force > 0:
        target.apply_knockback(direction, knockback_force)

    hit_confirmed.emit(target)
    _on_hit_effect(target)

    if lifetime <= 0:
        _expire()


func _on_hit_effect(target: Node) -> void:
    pass


func _expire() -> void:
    is_active = false
    queue_free()


func get_damage() -> Dictionary:
    return {
        "damage": damage,
        "type": damage_type,
    }
