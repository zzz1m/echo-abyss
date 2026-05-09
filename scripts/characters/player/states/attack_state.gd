extends State

@export var attack_duration: float = 0.3
@export var attack_cooldown: float = 0.2

var can_attack: bool = true
var attack_timer: float = 0.0


func enter() -> void:
    character.animation_player.play("attack")
    _perform_attack()


func physics_process(delta: float) -> void:
    character.velocity = Vector2.ZERO

    if not can_attack:
        attack_timer += delta
        if attack_timer >= attack_cooldown:
            can_attack = true
            attack_timer = 0.0


func handle_input(event: InputEvent) -> void:
    pass


func exit() -> void:
    character.animation_player.stop()


func _perform_attack() -> void:
    if character.hitbox_area:
        character.hitbox_area.monitoring = true

    await get_tree().create_timer(attack_duration).timeout
    if character.hitbox_area:
        character.hitbox_area.monitoring = false

    finished.emit()
