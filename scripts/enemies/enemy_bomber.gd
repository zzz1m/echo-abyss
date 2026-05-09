extends BaseEnemy

@export var explosion_damage: int = 80
@export var explosion_radius: float = 150.0
@export var charge_speed: float = 300.0

var is_charging: bool = false
var charge_target: Vector2 = Vector2.ZERO
var charge_timer: float = 0.0


func _ready() -> void:
    super._ready()
    enemy_type = EnemyType.SOLDIER
    enemy_name = "回响爆破者"
    max_health = 60
    speed = 70.0
    damage = 15
    attack_range = 40.0
    detection_range = 250.0


func _physics_process(delta: float) -> void:
    super._physics_process(delta)

    if is_charging:
        _process_charge(delta)


func _process_charge(delta: float) -> void:
    charge_timer += delta

    var direction = charge_target.normalized()
    velocity = direction * charge_speed
    move_and_slide()

    if global_position.distance_to(charge_target) < 20 or charge_timer > 2.0:
        _explode()
        is_charging = false


func attack() -> void:
    if not can_attack() or is_charging:
        return

    if randf() < 0.3:
        _start_charge()
    else:
        _basic_attack()


func _basic_attack() -> void:
    if animation_player.has_animation("attack"):
        animation_player.play("attack")

    var attack_hitbox = $HitboxArea
    if attack_hitbox:
        attack_hitbox.monitoring = true
        await get_tree().create_timer(0.3).timeout
        attack_hitbox.monitoring = false

    last_attack_time = Time.get_ticks_msec() / 1000.0


func _start_charge() -> void:
    if not target:
        return

    is_charging = true
    charge_target = target.global_position
    charge_timer = 0.0

    if animation_player.has_animation("charge"):
        animation_player.play("charge")


func _explode() -> void:
    if animation_player.has_animation("explode"):
        animation_player.play("explode")

    var all_targets = get_tree().get_nodes_in_group("player")
    for target_node in all_targets:
        var distance = global_position.distance_to(target_node.global_position)
        if distance <= explosion_radius and target_node.has_method("take_damage"):
            target_node.take_damage(explosion_damage)

    await get_tree().create_timer(0.5).timeout
    die()
