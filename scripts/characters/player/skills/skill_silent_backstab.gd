extends Skill


func _ready() -> void:
    super._ready()
    skill_name = "背刺"
    description = "对身后敌人发动致命一击，造成大量伤害"
    energy_cost = 30.0
    cooldown = 5.0
    key = "E"


func _execute_skill(caster: Node) -> void:
    var backstab_multiplier = 3.0
    var base_damage = 35

    var enemies = get_tree().get_nodes_in_group("enemy")
    for enemy in enemies:
        if enemy.has_method("is_in_back_range") and enemy.is_in_back_range(caster):
            if enemy.has_method("take_damage"):
                var damage = int(base_damage * backstab_multiplier)
                enemy.take_damage(damage)


class SkillSilentBackstab:
    extends Skill
