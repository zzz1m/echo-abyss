extends CharacterBody2D
class_name Player

signal health_changed(new_health: int)
signal energy_changed(new_energy: float)
signal died
signal skill_used(skill_key: String)

enum PlayerClass {
    LISTENER,
    ROARER,
    SILENT,
}

@export var player_class: PlayerClass = PlayerClass.LISTENER

@export var max_health: int = 100
@export var max_energy: float = 100.0
@export var speed: float = 200.0
@export var acceleration: float = 1000.0

var current_health: int = max_health
var current_energy: float = max_energy

var is_invincible: bool = false
var is_dead: bool = false

var facing_direction: Vector2 = Vector2.RIGHT

var state_machine: Node
var skill_system: Node

@onready var sprite: Sprite2D = $Sprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hitbox_area: Area2D = $HitboxArea
@onready var hurtbox_area: Area2D = $HurtboxArea
@onready var state_machine_node: Node = $StateMachine
@onready var skill_system_node: Node = $SkillSystem


func _ready() -> void:
    _setup_components()
    _connect_signals()


func _setup_components() -> void:
    state_machine = state_machine_node
    skill_system = skill_system_node

    add_to_group("player")
    hurtbox_area.area_entered.connect(_on_hurtbox_entered)


func _connect_signals() -> void:
    died.connect(_on_died)


func _physics_process(delta: float) -> void:
    if is_dead:
        return

    var input_direction = InputManager.get_movement_direction()
    facing_direction = input_direction if input_direction != Vector2.ZERO else facing_direction

    if facing_direction.x < 0:
        sprite.flip_h = true
    elif facing_direction.x > 0:
        sprite.flip_h = false

    move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
    if is_dead:
        return

    if event.is_action_pressed("skill_q"):
        _use_skill("Q")
    elif event.is_action_pressed("skill_w"):
        _use_skill("W")
    elif event.is_action_pressed("skill_e"):
        _use_skill("E")
    elif event.is_action_pressed("skill_r"):
        _use_skill("R")


func _use_skill(key: String) -> void:
    skill_used.emit(key)


func take_damage(amount: int, damage_type: int = 0) -> void:
    if is_invincible or is_dead:
        return

    current_health = max(0, current_health - amount)
    health_changed.emit(current_health)

    if current_health <= 0:
        die()


func heal(amount: int) -> void:
    current_health = min(max_health, current_health + amount)
    health_changed.emit(current_health)


func gain_energy(amount: float) -> void:
    current_energy = min(max_energy, current_energy + amount)
    energy_changed.emit(current_energy)


func consume_energy(amount: float) -> bool:
    if current_energy >= amount:
        current_energy -= amount
        energy_changed.emit(current_energy)
        return true
    return false


func die() -> void:
    is_dead = true
    died.emit()
    state_machine.set_state("dead")


func _on_hurtbox_entered(area: Area2D) -> void:
    if area.has_method("get_damage"):
        var damage_info = area.get_damage()
        take_damage(damage_info.damage, damage_info.type)


func _on_died() -> void:
    is_dead = true


func get_save_data() -> Dictionary:
    return {
        "player_class": player_class,
        "max_health": max_health,
        "current_health": current_health,
        "max_energy": max_energy,
        "current_energy": current_energy,
        "position": {
            "x": position.x,
            "y": position.y,
        },
    }


func load_save_data(data: Dictionary) -> void:
    player_class = data.get("player_class", PlayerClass.LISTENER)
    max_health = data.get("max_health", 100)
    current_health = data.get("current_health", max_health)
    max_energy = data.get("max_energy", 100.0)
    current_energy = data.get("current_energy", max_energy)

    var pos = data.get("position", {})
    position = Vector2(pos.get("x", 400), pos.get("y", 300))
