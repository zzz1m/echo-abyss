extends Skill


func _ready() -> void:
    super._ready()
    skill_name = "声波探测"
    description = "探测周围区域，短暂显示所有敌人位置并暴露隐藏敌人"
    energy_cost = 15.0
    cooldown = 8.0
    key = "W"


func _execute_skill(caster: Node) -> void:
    var reveal_radius = 300.0
    var enemies = get_tree().get_nodes_in_group("enemy")

    for enemy in enemies:
        var distance = caster.global_position.distance_to(enemy.global_position)
        if distance <= reveal_radius:
            if enemy.has_method("reveal"):
                enemy.reveal()


class SkillListenerSonar:
    extends Skill
