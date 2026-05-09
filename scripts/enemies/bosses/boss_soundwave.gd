extends Boss

@export var soundwave_cooldown: float = 5.0
@export var echo_clone_cooldown: float = 15.0
@export var scream_cooldown: float = 20.0

var soundwave_timer: float = 0.0
var echo_clone_timer: float = 0.0
var scream_timer: float = 0.0
var is_performing_ability: bool = false


func _ready() -> void:
    super._ready()
    enemy_name = "颤音魔女"
    max_health = 800
    speed = 70.0
    damage = 40
    attack_range = 50.0
    detection_range = 350.0

    soundwave_timer = soundwave_cooldown
    echo_clone_timer = echo_clone_cooldown
    scream_timer = scream_cooldown

    add_ability({"name": "soundwave", "active": true, "cooldown": soundwave_cooldown})
    add_ability({"name": "echo_clone", "active": false, "cooldown": echo_clone_cooldown})
    add_ability({"name": "piercing_scream", "active": false, "cooldown": scream_cooldown})


func _physics_process(delta: float) -> void:
    super._physics_process(delta)

    if is_dead or is_stunned or is_performing_ability:
        return

    soundwave_timer -= delta
    echo_clone_timer -= delta
    scream_timer -= delta

    if scream_timer <= 0 and current_phase >= 3:
        _perform_piercing_scream()
        scream_timer = scream_cooldown
    elif echo_clone_timer <= 0 and current_phase >= 2:
        _spawn_echo_clone()
        echo_clone_timer = echo_clone_cooldown
    elif soundwave_timer <= 0:
        _fire_soundwave()
        soundwave_timer = soundwave_cooldown


func attack() -> void:
    if not can_attack() or is_performing_ability:
        return
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


func _fire_soundwave() -> void:
    is_performing_ability = true

    var direction = (target.global_position - global_position).normalized()
    var projectile = preload("res://scenes/effects/projectiles/soundwave_projectile.tscn").instantiate()
    projectile.damage = int(damage * 1.2)
    projectile.direction = direction

    get_parent().add_child(projectile)
    projectile.global_position = global_position

    is_performing_ability = false


func _spawn_echo_clone() -> void:
    is_performing_ability = true

    var clone = preload("res://scenes/enemies/common/echo_clone.tscn").instantiate()
    clone.max_health = 50
    clone.damage = int(damage * 0.3)

    var offset = Vector2(randf_range(-50, 50), randf_range(-50, 50))
    clone.global_position = global_position + offset

    get_parent().add_child(clone)

    is_performing_ability = false


func _perform_piercing_scream() -> void:
    is_performing_ability = true

    if animation_player.has_animation("scream"):
        animation_player.play("scream")

    await get_tree().create_timer(0.5).timeout

    var scream_range = 400.0
    var all_targets = get_tree().get_nodes_in_group("enemy")
    var player = get_tree().get_first_node_in_group("player")

    for target_node in all_targets:
        if target_node != self:
            var distance = global_position.distance_to(target_node.global_position)
            if distance <= scream_range and target_node.has_method("take_damage"):
                target_node.take_damage(int(damage * 0.5))

    if player:
        var player_distance = global_position.distance_to(player.global_position)
        if player_distance <= scream_range:
            player.take_damage(int(damage * 2.0))
            if player.has_method("apply_stun"):
                player.apply_stun(1.5)

    is_performing_ability = false


func _on_phase_entered(phase: int) -> void:
    super._on_phase_entered(phase)

    match phase:
        2:
            echo_clone_timer = 2.0
        3:
            echo_clone_timer = 1.0
            scream_timer = 3.0
