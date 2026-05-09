extends BaseEnemy

signal phase_changed(new_phase: int)
signal enrage_started

@export var max_phases: int = 3
@export var enrage_threshold: float = 0.2
@export var phase_health_thresholds: Array[float] = [0.66, 0.33]

var current_phase: int = 1
var is_enraged: bool = false
var abilities: Array = []


func _ready() -> void:
    super._ready()
    enemy_type = EnemyType.BOSS


func _physics_process(delta: float) -> void:
    super._physics_process(delta)
    _check_phase_change()
    _check_enrage()


func _check_phase_change() -> void:
    var health_percent = float(current_health) / float(max_health)

    for i in range(phase_health_thresholds.size()):
        var threshold = phase_health_thresholds[i]
        if health_percent <= threshold and current_phase < i + 2:
            _change_phase(i + 2)
            break


func _change_phase(new_phase: int) -> void:
    current_phase = new_phase
    phase_changed.emit(current_phase)
    _on_phase_entered(new_phase)


func _on_phase_entered(phase: int) -> void:
    match phase:
        2:
            speed *= 1.2
            damage = int(damage * 1.3)
        3:
            speed *= 1.4
            damage = int(damage * 1.5)
            _activate_all_abilities()


func _check_enrage() -> void:
    if is_enraged:
        return

    var health_percent = float(current_health) / float(max_health)
    if health_percent <= enrage_threshold:
        _activate_enrage()


func _activate_enrage() -> void:
    is_enraged = true
    speed *= 1.5
    damage = int(damage * 2.0)
    enrage_started.emit()


func add_ability(ability: Dictionary) -> void:
    abilities.append(ability)


func use_ability(ability_name: String) -> bool:
    if is_dead or is_stunned:
        return false

    var ability = abilities.find(ability_name)
    if ability == -1:
        return false

    _execute_ability(ability_name)
    return true


func _execute_ability(ability_name: String) -> void:
    match ability_name:
        "slam":
            _ability_slam()
        "summon":
            _ability_summon()


func _activate_all_abilities() -> void:
    for ability in abilities:
        if ability is Dictionary:
            ability["active"] = true


func _ability_slam() -> void:
    if animation_player.has_animation("slam"):
        animation_player.play("slam")

    var slam_range = 150.0
    var player = get_tree().get_first_node_in_group("player")
    if player:
        var distance = global_position.distance_to(player.global_position)
        if distance <= slam_range:
            player.take_damage(int(damage * 1.5))


func _ability_summon() -> void:
    pass
