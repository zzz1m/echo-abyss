extends BaseEnemy

@export var attack_count: int = 3

var attack_counter: int = 0
var is_charging: bool = false


func _ready() -> void:
    super._ready()
    enemy_type = EnemyType.SCOUT
    enemy_name = "阴影爬行者"
    max_health = 40
    speed = 80.0
    damage = 12
    attack_range = 50.0
    detection_range = 150.0


func _physics_process(delta: float) -> void:
    super._physics_process(delta)


func attack() -> void:
    if not can_attack():
        return

    attack_counter += 1

    if animation_player.has_animation("attack"):
        animation_player.play("attack")

    if animation_player.has_animation("charge"):
        is_charging = true
        animation_player.play("charge")
        await get_tree().create_timer(0.5).timeout
        is_charging = false
        _perform_charge_attack()

    last_attack_time = Time.get_ticks_msec() / 1000.0


func _perform_charge_attack() -> void:
    if not target:
        return

    var direction = (target.global_position - global_position).normalized()
    var charge_velocity = direction * speed * 3

    velocity = charge_velocity
    move_and_slide()

    var attack_hitbox = $HitboxArea
    if attack_hitbox:
        attack_hitbox.monitoring = true
        await get_tree().create_timer(0.3).timeout
        attack_hitbox.monitoring = false

    if attack_counter >= attack_count:
        attack_counter = 0
        if animation_player.has_animation("idle"):
            animation_player.play("idle")
