extends Skill


func _ready() -> void:
    super._ready()
    skill_name = "隐身"
    description = "进入隐身状态，大幅降低敌人检测范围"
    energy_cost = 25.0
    cooldown = 12.0
    key = "W"


func _execute_skill(caster: Node) -> void:
    var invisibility_duration = 5.0

    if caster.has_method("set_invisible"):
        caster.set_invisible(true)

    if caster.has_method("apply_buff"):
        caster.apply_buff({
            "type": "stealth",
            "duration": invisibility_duration,
            "value": 0.5,
        })

    await get_tree().create_timer(invisibility_duration).timeout

    if caster.has_method("set_invisible"):
        caster.set_invisible(false)


class SkillSilentStealth:
    extends Skill
