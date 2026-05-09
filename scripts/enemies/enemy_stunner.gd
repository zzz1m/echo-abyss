extends BaseEnemy

@export var stun_duration: float = 2.0
@export var stun_cooldown: float = 6.0

var stun_timer: float = 0.0


func _ready() -> void:
    super._ready()
    enemy_type = EnemyType.SOLDIER
    enemy_name = "震荡者"
    max_health = 70
    speed = 85.0
    damage = 15
    attack_range = 50.0
    detection_range = 200.0


func attack() -> void:
    if not can_attack():
        return

    if animation_player.has_animation("attack"):
        animation_player.play("attack")

    _perform_stun_attack()

    last_attack_time = Time.get_ticks_msec() / 1000.0


func _perform_stun_attack() -> void:
    var attack_hitbox = $HitboxArea
    if attack_hitbox:
        attack_hitbox.monitoring = true
        await get_tree().create_timer(0.2).timeout
        attack_hitbox.monitoring = false

    if target and target.has_method("apply_stun"):
        target.apply_stun(stun_duration)


func _physics_process(delta: float) -> void:
    super._physics_process(delta)

    if stun_timer > 0:
        stun_timer -= delta


func apply_stun(duration: float) -> void:
    stun_timer = max(stun_timer, duration)
