extends State


func enter() -> void:
    character.animation_player.play("walk")


func physics_process(delta: float) -> void:
    var input_direction = InputManager.get_movement_direction()

    if input_direction == Vector2.ZERO:
        state_machine.set_state("idle")
        return

    character.velocity = character.velocity.move_toward(
        input_direction * character.speed,
        character.acceleration * delta
    )


func handle_input(event: InputEvent) -> void:
    if event.is_action_pressed("attack"):
        state_machine.set_state("attack")
    elif event.is_action_pressed("skill_q") or event.is_action_pressed("skill_w") or \
         event.is_action_pressed("skill_e") or event.is_action_pressed("skill_r"):
        state_machine.set_state("skill")
