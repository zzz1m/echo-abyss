extends BaseEnemy

@export var shield_amount: int = 50
@export var shield_regen_rate: float = 5.0
@export var shield_regen_delay: float = 5.0

var current_shield: int = 0
var last_damage_time: float = 0.0
var is_shield_active: bool = false


func _ready() -> void:
    super._ready()
    enemy_type = EnemyType.ELITE
    enemy_name = "回响守卫"
    max_health = 200
    speed = 60.0
    damage = 25
    attack_range = 55.0
    detection_range = 200.0
    current_shield = shield_amount


func _physics_process(delta: float) -> void:
    super._physics_process(delta)

    if current_shield < shield_amount:
        var time_since_damage = Time.get_ticks_msec() / 1000.0 - last_damage_time
        if time_since_damage >= shield_regen_delay:
            current_shield = min(shield_amount, current_shield + shield_regen_rate * delta)


func take_damage(amount: int, damage_type: int = 0) -> void:
    if is_dead:
        return

    var remaining_damage = amount

    if current_shield > 0:
        var shield_damage = min(current_shield, remaining_damage)
        current_shield -= shield_damage
        remaining_damage -= shield_damage

        if current_shield <= 0:
            _on_shield_break()

    if remaining_damage > 0:
        current_health = max(0, current_health - remaining_damage)
        health_changed.emit(current_health)

    last_damage_time = Time.get_ticks_msec() / 1000.0

    if current_health <= 0:
        die()
    else:
        _on_damaged()


func _on_shield_break() -> void:
    is_shield_active = false


func get_shield_percent() -> float:
    return float(current_shield) / float(shield_amount)


func _on_died() -> void:
    super._on_died()
