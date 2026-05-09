extends Skill


func _ready() -> void:
    super._ready()
    skill_name = "沉默领域"
    description = "在脚下创建沉默领域，区域内敌人无法使用技能"
    energy_cost = 35.0
    cooldown = 12.0
    key = "E"


func _execute_skill(caster: Node) -> void:
    var zone = preload("res://scenes/effects/areas/silence_zone.tscn").instantiate()
    zone.duration = 4.0
    zone.radius = 150.0

    caster.get_parent().add_child(zone)
    zone.global_position = caster.global_position

    AudioManager.play_sfx("skill_silence")


class SkillListenerSilenceZone:
    extends Skill
