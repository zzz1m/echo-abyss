extends Skill


func _ready() -> void:
    super._ready()
    skill_name = "终极共鸣"
    description = "释放全部回响能量，对全场敌人造成大量伤害并眩晕"
    energy_cost = 60.0
    cooldown = 30.0
    key = "R"


func _execute_skill(caster: Node) -> void:
    var all_enemies = get_tree().get_nodes_in_group("enemy")
    var center_position = caster.global_position

    for enemy in all_enemies:
        var distance = center_position.distance_to(enemy.global_position)
        if distance <= 500:
            if enemy.has_method("take_damage"):
                enemy.take_damage(80)
            if enemy.has_method("apply_stun"):
                enemy.apply_stun(2.0)


class SkillListenerUltimateResonance:
    extends Skill
