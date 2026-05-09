extends SkillEffect

@export var dash_distance: float = 200.0
@export var dash_speed: float = 1500.0
@export var invulnerable_during_dash: bool = true
@export var damage_on_dash: int = 0
@export var trail_effect: bool = true

var start_position: Vector2
var dash_progress: float = 0.0
var end_position: Vector2
var was_invulnerable: bool = false


func _ready() -> void:
    super._ready()
    effect_type = "dash"
    duration = dash_distance / dash_speed


func start_dash(start: Vector2, direction: Vector2) -> void:
    start_position = start
    global_position = start_position
    end_position = start_position + direction.normalized() * dash_distance
    dash_progress = 0.0

    var character = get_parent()
    if character and invulnerable_during_dash:
        was_invulnerable = character.is_invincible
        character.is_invincible = true


func _physics_process(delta: float) -> void:
    if not is_active:
        return

    dash_progress += dash_speed * delta / dash_distance

    if dash_progress >= 1.0:
        dash_progress = 1.0
        _on_dash_complete()

    global_position = start_position.lerp(end_position, ease(dash_progress, 0.2))

    if damage_on_dash > 0:
        _check_dash_damage()

    duration -= delta
    if duration <= 0:
        _on_effect_finished()


func _check_dash_damage() -> void:
    var enemies = get_tree().get_nodes_in_group("enemy")
    for enemy in enemies:
        if is_instance_valid(enemy):
            var distance = global_position.distance_to(enemy.global_position)
            if distance <= 50 and enemy not in targets_hit:
                enemy.take_damage(damage_on_dash)
                targets_hit.append(enemy)


func _on_dash_complete() -> void:
    var character = get_parent()
    if character:
        character.is_invincible = was_invulnerable
        character.velocity = Vector2.ZERO

    _on_effect_finished()
