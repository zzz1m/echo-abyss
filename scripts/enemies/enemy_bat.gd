extends BaseEnemy

@export var bounce_count: int = 3
@export var bounce_damage: int = 8
@export var bounce_range: float = 100.0

var bounced_targets: Array = []
var is_bouncing: bool = false


func _ready() -> void:
    super._ready()
    enemy_type = EnemyType.SCOUT
    enemy_name = "回响蝙蝠"
    max_health = 30
    speed = 150.0
    damage = 8
    attack_range = 30.0
    detection_range = 180.0


func attack() -> void:
    if not can_attack():
        return

    if animation_player.has_animation("attack"):
        animation_player.play("attack")

    _bounce_attack()

    last_attack_time = Time.get_ticks_msec() / 1000.0


func _bounce_attack() -> void:
    bounced_targets.clear()
    bounced_targets.append(target)

    var current_target = target
    for i in range(bounce_count):
        if current_target and current_target.has_method("take_damage"):
            current_target.take_damage(bounce_damage)

        var next_target = _find_nearest_enemy(current_target.global_position)
        if next_target and next_target != current_target:
            current_target = next_target
            bounced_targets.append(next_target)
        else:
            break


func _find_nearest_enemy(from_position: Vector2) -> Node2D:
    var enemies = get_tree().get_nodes_in_group("enemy")
    var player = get_tree().get_first_node_in_group("player")

    var nearest: Node2D = null
    var nearest_distance := INF

    for enemy in enemies:
        if enemy == self or enemy in bounced_targets:
            continue

        var distance = from_position.distance_to(enemy.global_position)
        if distance <= bounce_range and distance < nearest_distance:
            nearest = enemy
            nearest_distance = distance

    if player and player not in bounced_targets:
        var player_distance = from_position.distance_to(player.global_position)
        if player_distance <= bounce_range and player_distance < nearest_distance:
            nearest = player

    return nearest


func _on_died() -> void:
    if animation_player.has_animation("death"):
        animation_player.play("death")
    await get_tree().create_timer(0.5).timeout
    queue_free()
