extends State


func enter() -> void:
    character.animation_player.play("hurt")


func physics_process(_delta: float) -> void:
    character.velocity = Vector2.ZERO


func handle_input(_event: InputEvent) -> void:
    pass


func exit() -> void:
    character.animation_player.stop()
