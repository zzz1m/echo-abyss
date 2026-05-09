extends State

@export var skill_duration: float = 0.5

var current_skill_key: String = ""


func enter() -> void:
    pass


func physics_process(delta: float) -> void:
    character.velocity = Vector2.ZERO


func handle_input(event: InputEvent) -> void:
    if event.is_action_pressed("skill_q"):
        _cast_skill("Q")
    elif event.is_action_pressed("skill_w"):
        _cast_skill("W")
    elif event.is_action_pressed("skill_e"):
        _cast_skill("E")
    elif event.is_action_pressed("skill_r"):
        _cast_skill("R")


func _cast_skill(key: String) -> void:
    current_skill_key = key
    character.animation_player.play("skill_" + key.to_lower())

    if character.skill_system:
        var skill = character.skill_system.get_skill(key)
        if skill and skill.use(character):
            character.skill_used.emit(key)

    await get_tree().create_timer(skill_duration).timeout
    finished.emit()


func exit() -> void:
    character.animation_player.stop()
