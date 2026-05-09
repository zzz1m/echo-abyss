extends BaseEnemy

@export var poison_damage: int = 5
@export var poison_duration: float = 3.0
@export var poison_cooldown: float = 5.0

var poison_timer: float = 0.0


func _ready() -> void:
    super._ready()
    enemy_type = EnemyType.SOLDIER
    enemy_name = "剧毒蜗牛"
    max_health = 100
    speed = 30.0
    damage = 8
    attack_range = 30.0
    detection_range = 150.0


func attack() -> void:
    if not can_attack():
        return

    if animation_player.has_animation("attack"):
        animation_player.play("attack")

    var attack_hitbox = $HitboxArea
    if attack_hitbox:
        attack_hitbox.monitoring = true
        await get_tree().create_timer(0.3).timeout
        attack_hitbox.monitoring = false

    _apply_poison()

    last_attack_time = Time.get_ticks_msec() / 1000.0


func _apply_poison() -> void:
    if poison_timer > 0:
        return

    if target and target.has_method("apply_status_effect"):
        var effect = StatusEffect.new()
        effect.effect_type = StatusEffect.EffectType.POISON
        effect.duration = poison_duration
        effect.intensity = poison_damage
        target.apply_status_effect(effect)

    poison_timer = poison_cooldown


func _physics_process(delta: float) -> void:
    super._physics_process(delta)

    if poison_timer > 0:
        poison_timer -= delta
