extends CharacterBody2D
class_name BaseEnemy

signal died
signal health_changed(new_health: int)
signal aggro_changed(is_aggro: bool)

enum EnemyType {
    SCOUT,
    SOLDIER,
    ELITE,
    BOSS,
}

@export var enemy_type: EnemyType = EnemyType.SCOUT
@export var enemy_name: String = "Enemy"
@export var max_health: int = 50
@export var speed: float = 100.0
@export var damage: int = 10
@export var attack_range: float = 40.0
@export var detection_range: float = 200.0
@export var attack_cooldown: float = 1.0

var current_health: int = max_health
var is_dead: bool = false
var is_aggro: bool = false
var is_stunned: bool = false
var stun_duration: float = 0.0

var target: Node2D = null
var last_attack_time: float = 0.0

@onready var sprite: Sprite2D = $Sprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var state_machine: Node = $StateMachine
@onready var hurtbox: Area2D = $HurtboxArea


func _ready() -> void:
    _setup_enemy()
    _connect_signals()


func _setup_enemy() -> void:
    add_to_group("enemy")
    current_health = max_health
    hurtbox.area_entered.connect(_on_hurtbox_entered)


func _connect_signals() -> void:
    died.connect(_on_died)


func _physics_process(delta: float) -> void:
    if is_stunned:
        stun_duration -= delta
        if stun_duration <= 0:
            is_stunned = false

    if target and not is_dead and not is_stunned:
        _update_aggro_status()


func _update_aggro_status() -> void:
    var distance_to_target = global_position.distance_to(target.global_position)
    var was_aggro = is_aggro
    is_aggro = distance_to_target <= detection_range

    if was_aggro != is_aggro:
        aggro_changed.emit(is_aggro)


func _on_hurtbox_entered(area: Area2D) -> void:
    if area.has_method("get_damage"):
        var damage_info = area.get_damage()
        take_damage(damage_info.damage, damage_info.type)


func take_damage(amount: int, damage_type: int = 0) -> void:
    if is_dead:
        return

    current_health = max(0, current_health - amount)
    health_changed.emit(current_health)

    if current_health <= 0:
        die()
    else:
        _on_damaged()


func _on_damaged() -> void:
    if animation_player.has_animation("hurt"):
        animation_player.play("hurt")


func heal(amount: int) -> void:
    current_health = min(max_health, current_health + amount)
    health_changed.emit(current_health)


func die() -> void:
    is_dead = true
    died.emit()
    _on_death()


func _on_death() -> void:
    if animation_player.has_animation("death"):
        animation_player.play("death")
    await get_tree().create_timer(1.0).timeout
    queue_free()


func apply_stun(duration: float) -> void:
    is_stunned = true
    stun_duration = duration


func reveal() -> void:
    if sprite.modulate.a < 1.0:
        sprite.modulate.a = 1.0


func get_damage() -> Dictionary:
    return {
        "damage": damage,
        "type": 0,
    }


func can_attack() -> bool:
    if not target:
        return false

    var distance_to_target = global_position.distance_to(target.global_position)
    return distance_to_target <= attack_range and not is_dead and not is_stunned


func attack() -> void:
    if not can_attack():
        return

    if animation_player.has_animation("attack"):
        animation_player.play("attack")

    var attack_hitbox = $HitboxArea
    if attack_hitbox:
        attack_hitbox.monitoring = true
        await get_tree().create_timer(0.2).timeout
        attack_hitbox.monitoring = false

    last_attack_time = Time.get_ticks_msec() / 1000.0


func get_save_data() -> Dictionary:
    return {
        "enemy_name": enemy_name,
        "max_health": max_health,
        "current_health": current_health,
        "position": {
            "x": global_position.x,
            "y": global_position.y,
        },
    }
