extends BaseEnemy

@export var healing_threshold: float = 0.3
@export var heal_amount: int = 20
@export var heal_cooldown: float = 10.0

var can_heal: bool = true
var heal_timer: float = 0.0


func _ready() -> void:
    super._ready()
    enemy_type = EnemyType.ELITE
    enemy_name = "旋律幽灵"
    max_health = 150
    speed = 90.0
    damage = 20
    attack_range = 40.0
    detection_range = 250.0


func _physics_process(delta: float) -> void:
    super._physics_process(delta)

    if not can_heal:
        heal_timer -= delta
        if heal_timer <= 0:
            can_heal = true


func attack() -> void:
    if not can_attack():
        return

    if _should_heal():
        _perform_heal()
        return

    if animation_player.has_animation("attack"):
        animation_player.play("attack")

    var attack_hitbox = $HitboxArea
    if attack_hitbox:
        attack_hitbox.monitoring = true
        await get_tree().create_timer(0.3).timeout
        attack_hitbox.monitoring = false

    last_attack_time = Time.get_ticks_msec() / 1000.0


func _should_heal() -> bool:
    if not can_heal:
        return false

    var health_percent = float(current_health) / float(max_health)
    return health_percent <= healing_threshold and current_health < max_health


func _perform_heal() -> void:
    if animation_player.has_animation("heal"):
        animation_player.play("heal")

    heal(heal_amount)
    can_heal = false
    heal_timer = heal_cooldown

    last_attack_time = Time.get_ticks_msec() / 1000.0
