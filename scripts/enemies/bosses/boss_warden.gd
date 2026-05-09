extends Boss

@export var ground_slam_cooldown: float = 8.0
@export var shockwave_radius: float = 200.0

var ground_slam_timer: float = 0.0
var is_performing_ability: bool = false


func _ready() -> void:
    super._ready()
    enemy_type = EnemyType.BOSS
    enemy_name = "回响守卒"
    max_health = 500
    speed = 80.0
    damage = 35
    attack_range = 60.0
    detection_range = 300.0

    ground_slam_timer = ground_slam_cooldown

    add_ability({"name": "ground_slam", "active": false, "cooldown": ground_slam_cooldown})
    add_ability({"name": "shield_bash", "active": true, "cooldown": 3.0})


func _physics_process(delta: float) -> void:
    super._physics_process(delta)

    if is_dead or is_stunned or is_performing_ability:
        return

    ground_slam_timer -= delta
    if ground_slam_timer <= 0 and current_phase >= 2:
        _perform_ground_slam()
        ground_slam_timer = ground_slam_cooldown


func attack() -> void:
    if not can_attack() or is_performing_ability:
        return

    if randf() < 0.3 and current_phase >= 2:
        _perform_shield_bash()
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


func _perform_shield_bash() -> void:
    is_performing_ability = true

    if animation_player.has_animation("shield_bash"):
        animation_player.play("shield_bash")

    await get_tree().create_timer(0.5).timeout

    var bash_range = 80.0
    var player = get_tree().get_first_node_in_group("player")
    if player:
        var distance = global_position.distance_to(player.global_position)
        if distance <= bash_range:
            player.take_damage(int(damage * 1.2))
            if player.has_method("apply_stun"):
                player.apply_stun(1.0)

    is_performing_ability = false
    last_attack_time = Time.get_ticks_msec() / 1000.0


func _perform_ground_slam() -> void:
    is_performing_ability = true

    if animation_player.has_animation("ground_slam"):
        animation_player.play("ground_slam")

    await get_tree().create_timer(0.8).timeout

    var shockwave = preload("res://scenes/effects/areas/shockwave.tscn").instantiate()
    shockwave.radius = shockwave_radius
    shockwave.damage = int(damage * 1.8)
    shockwave.global_position = global_position

    get_parent().add_child(shockwave)

    is_performing_ability = false


func _on_phase_entered(phase: int) -> void:
    super._on_phase_entered(phase)

    match phase:
        2:
            ground_slam_cooldown = 6.0
            ground_slam_timer = ground_slam_cooldown
        3:
            ground_slam_cooldown = 4.0
            ground_slam_timer = ground_slam_cooldown
