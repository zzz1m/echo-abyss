extends Skill


func _ready() -> void:
    super._ready()
    skill_name = "地震践踏"
    description = "重重踩踏地面，造成范围伤害并眩晕范围内敌人"
    energy_cost = 40.0
    cooldown = 14.0
    key = "E"


func _execute_skill(caster: Node) -> void:
    var stomp_radius = 180.0
    var stomp_damage = 50
    var stun_duration = 2.0

    var enemies = get_tree().get_nodes_in_group("enemy")
    for enemy in enemies:
        var distance = caster.global_position.distance_to(enemy.global_position)
        if distance <= stomp_radius:
            if enemy.has_method("take_damage"):
                enemy.take_damage(stomp_damage)
            if enemy.has_method("apply_stun"):
                enemy.apply_stun(stun_duration)


class SkillRoarerEarthquake:
    extends Skill
