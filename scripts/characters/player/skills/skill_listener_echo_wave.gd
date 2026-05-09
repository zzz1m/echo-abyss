extends Skill


func _ready() -> void:
    super._ready()
    skill_name = "回响冲击"
    description = "向前方发射一道音波冲击波，对路径上的敌人造成伤害"
    energy_cost = 20.0
    cooldown = 5.0
    key = "Q"


func _execute_skill(caster: Node) -> void:
    var direction = caster.facing_direction
    var spawn_position = caster.global_position + direction * 40

    var projectile = preload("res://scenes/effects/projectiles/echo_wave.tscn").instantiate()
    projectile.direction = direction
    projectile.damage = 30
    projectile.speed = 400
    projectile.lifetime = 1.5

    caster.get_parent().add_child(projectile)
    projectile.global_position = spawn_position

    AudioManager.play_sfx("skill_echo_wave")


class SkillListenerEchoWave:
    extends Skill
