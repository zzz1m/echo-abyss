extends BaseEnemy

@export var heal_amount: int = 30
@export var heal_cooldown: float = 8.0
@export var heal_radius: float = 100.0

var can_heal: bool = true
var heal_timer: float = 0.0


func _ready() -> void:
    super._ready()
    enemy_type = EnemyType.SOLDIER
    enemy_name = "回响治愈者"
    max_health = 80
    speed = 80.0
    damage = 10
    attack_range = 35.0
    detection_range = 200.0


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
    else:
        _basic_attack()


func _should_heal() -> bool:
    if not can_heal:
        return false

    var health_percent = float(current_health) / float(max_health)

    if health_percent < 0.7:
        var nearby_allies = _get_nearby_allies()
        if nearby_allies.size() > 0 or health_percent < 0.5:
            return true

    return false


func _get_nearby_allies() -> Array:
    var allies = []
    var enemies = get_tree().get_nodes_in_group("enemy")

    for enemy in enemies:
        if enemy != self:
            var distance = global_position.distance_to(enemy.global_position)
            if distance <= heal_radius:
                allies.append(enemy)

    return allies


func _perform_heal() -> void:
    if animation_player.has_animation("heal"):
        animation_player.play("heal")

    heal(heal_amount)

    var allies = _get_nearby_allies()
    for ally in allies:
        if ally.has_method("heal"):
            ally.heal(int(heal_amount * 0.5))

    can_heal = false
    heal_timer = heal_cooldown

    last_attack_time = Time.get_ticks_msec() / 1000.0


func _basic_attack() -> void:
    if animation_player.has_animation("attack"):
        animation_player.play("attack")

    var attack_hitbox = $HitboxArea
    if attack_hitbox:
        attack_hitbox.monitoring = true
        await get_tree().create_timer(0.2).timeout
        attack_hitbox.monitoring = false

    last_attack_time = Time.get_ticks_msec() / 1000.0
