extends Skill


func _ready() -> void:
    super._ready()
    skill_name = "毁灭咆哮"
    description = "释放毁天灭地的咆哮，对所有敌人造成大量伤害"
    energy_cost = 70.0
    cooldown = 35.0
    key = "R"


func _execute_skill(caster: Node) -> void:
    var scream_damage = 100
    var enemies = get_tree().get_nodes_in_group("enemy")

    for enemy in enemies:
        if enemy.has_method("take_damage"):
            enemy.take_damage(scream_damage)
        if enemy.has_method("apply_stun"):
            enemy.apply_stun(1.5)


class SkillRoarerUltimate:
    extends Skill
