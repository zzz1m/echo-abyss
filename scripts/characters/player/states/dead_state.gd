extends State


func enter() -> void:
    character.animation_player.play("dead")
    character.is_dead = true


func physics_process(_delta: float) -> void:
    character.velocity = Vector2.ZERO
