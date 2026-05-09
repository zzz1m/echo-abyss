extends Boss

@export var void_blast_cooldown: float = 4.0
@export var gravity_well_cooldown: float = 12.0
@export var dimensional_rift_cooldown: float = 25.0

var void_blast_timer: float = 0.0
var gravity_well_timer: float = 0.0
var dimensional_rift_timer: float = 0.0
var is_performing_ability: bool = false
var rift_active: bool = false


func _ready() -> void:
    super._ready()
    enemy_name = "深渊之心"
    max_health = 1200
    speed = 60.0
    damage = 50
    attack_range = 60.0
    detection_range = 400.0

    void_blast_timer = void_blast_cooldown
    gravity_well_timer = gravity_well_cooldown
    dimensional_rift_timer = dimensional_rift_cooldown

    add_ability({"name": "void_blast", "active": true, "cooldown": void_blast_cooldown})
    add_ability({"name": "gravity_well", "active": false, "cooldown": gravity_well_cooldown})
    add_ability({"name": "dimensional_rift", "active": false, "cooldown": dimensional_rift_cooldown})


func _physics_process(delta: float) -> void:
    super._physics_process(delta)

    if is_dead or is_stunned:
        return

    void_blast_timer -= delta
    gravity_well_timer -= delta
    dimensional_rift_timer -= delta

    if dimensional_rift_timer <= 0 and current_phase >= 3:
        _activate_dimensional_rift()
        dimensional_rift_timer = dimensional_rift_cooldown
    elif gravity_well_timer <= 0 and current_phase >= 2:
        _create_gravity_well()
        gravity_well_timer = gravity_well_cooldown
    elif void_blast_timer <= 0:
        _fire_void_blast()
        void_blast_timer = void_blast_cooldown


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
        await get_tree().create_timer(0.4).timeout
        attack_hitbox.monitoring = false

    last_attack_time = Time.get_ticks_msec() / 1000.0


func _fire_void_blast() -> void:
    is_performing_ability = true

    var direction = (target.global_position - global_position).normalized()

    for i in range(3):
        var angle_offset = (i - 1) * 0.3
        var rotated_direction = direction.rotated(angle_offset)

        var projectile = preload("res://scenes/effects/projectiles/void_bolt.tscn").instantiate()
        projectile.damage = int(damage * 1.3)
        projectile.direction = rotated_direction

        get_parent().add_child(projectile)
        projectile.global_position = global_position

        await get_tree().create_timer(0.15).timeout

    is_performing_ability = false


func _create_gravity_well() -> void:
    is_performing_ability = true

    var well = preload("res://scenes/effects/areas/gravity_well.tscn").instantiate()
    well.damage_per_tick = 15
    well.pull_strength = 100

    get_parent().add_child(well)
    well.global_position = global_position + (target.global_position - global_position) * 0.5

    await get_tree().create_timer(5.0).timeout
    is_performing_ability = false


func _activate_dimensional_rift() -> void:
    is_performing_ability = true
    rift_active = true

    if animation_player.has_animation("rift"):
        animation_player.play("rift")

    var rift1 = preload("res://scenes/effects/areas/dimensional_rift.tscn").instantiate()
    rift1.global_position = global_position + Vector2(-200, 0)
    get_parent().add_child(rift1)

    var rift2 = preload("res://scenes/effects/areas/dimensional_rift.tscn").instantiate()
    rift2.global_position = global_position + Vector2(200, 0)
    get_parent().add_child(rift2)

    await get_tree().create_timer(8.0).timeout

    rift1.queue_free()
    rift2.queue_free()
    rift_active = false
    is_performing_ability = false


func _on_phase_entered(phase: int) -> void:
    super._on_phase_entered(phase)

    match phase:
        2:
            gravity_well_timer = 3.0
        3:
            gravity_well_timer = 2.0
            dimensional_rift_timer = 5.0
