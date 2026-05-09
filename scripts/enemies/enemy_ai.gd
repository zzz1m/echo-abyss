extends Node
class_name EnemyAI

signal target_acquired(new_target: Node2D)
signal target_lost

@export var enemy: BaseEnemy
@export var patrol_points: Array[Vector2] = []
@export var patrol_speed: float = 50.0
@export var chase_speed: float = 120.0
@export var idle_duration: float = 2.0

var current_patrol_index: int = 0
var is_patrolling: bool = false
var is_chasing: bool = false
var idle_timer: float = 0.0


func _ready() -> void:
    _setup_ai()


func _setup_ai() -> void:
    if enemy:
        enemy.aggro_changed.connect(_on_aggro_changed)
        enemy.died.connect(_on_enemy_died)
        _find_target()


func _physics_process(delta: float) -> void:
    if not enemy or enemy.is_dead or enemy.is_stunned:
        return

    _find_target()

    if not enemy.is_aggro or not enemy.target:
        _patrol(delta)
    else:
        _chase(delta)


func _find_target() -> void:
    if enemy.target:
        return

    var player = get_tree().get_first_node_in_group("player")
    if player:
        enemy.target = player
        target_acquired.emit(player)


func _patrol(delta: float) -> void:
    if not is_patrolling:
        if idle_timer > 0:
            idle_timer -= delta
            return
        is_patrolling = true
        _move_to_next_patrol_point()

    if patrol_points.size() > 0 and is_patrolling:
        var target_point = patrol_points[current_patrol_index]
        var direction = (target_point - enemy.global_position).normalized()

        enemy.velocity = direction * patrol_speed
        enemy.move_and_slide()

        if enemy.global_position.distance_to(target_point) < 10:
            is_patrolling = false
            idle_timer = idle_duration
            current_patrol_index = (current_patrol_index + 1) % patrol_points.size()


func _chase(delta: float) -> void:
    if not enemy.target:
        return

    var target_position = enemy.target.global_position
    var direction = (target_position - enemy.global_position).normalized()

    enemy.velocity = direction * chase_speed
    enemy.move_and_slide()

    if enemy.facing_direction.x < 0:
        enemy.sprite.flip_h = true
    elif enemy.facing_direction.x > 0:
        enemy.sprite.flip_h = false


func _on_aggro_changed(is_aggro: bool) -> void:
    is_chasing = is_aggro

    if is_aggro and enemy.target:
        target_acquired.emit(enemy.target)
    elif not is_aggro:
        target_lost.emit()


func _on_enemy_died() -> void:
    enemy = null


func add_patrol_point(point: Vector2) -> void:
    patrol_points.append(point)


func clear_patrol_points() -> void:
    patrol_points.clear()
    current_patrol_index = 0
