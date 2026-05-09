extends Skill


func _ready() -> void:
    super._ready()
    skill_name = "暗影领域"
    description = "创造一个暗影领域，领域内敌人受到持续伤害且移动速度降低"
    energy_cost = 60.0
    cooldown = 25.0
    key = "R"


func _execute_skill(caster: Node) -> void:
    var zone = preload("res://scenes/effects/areas/shadow_zone.tscn").instantiate()
    zone.duration = 8.0
    zone.radius = 250.0
    zone.damage_per_tick = 10
    zone.slow_amount = 0.3

    caster.get_parent().add_child(zone)
    zone.global_position = caster.global_position


class SkillSilentShadowDomain:
    extends Skill
