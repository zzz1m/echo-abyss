extends Skill


func _ready() -> void:
    super._ready()
    skill_name = "震荡波"
    description = "释放强力声波，对前方扇形区域内敌人造成伤害并击退"
    energy_cost = 25.0
    cooldown = 6.0
    key = "Q"


func _execute_skill(caster: Node) -> void:
    var direction = caster.facing_direction
    var fan_angle = PI / 3
    var radius = 150.0

    var enemies = get_tree().get_nodes_in_group("enemy")
    for enemy in enemies:
        var to_enemy = enemy.global_position - caster.global_position
        var angle = direction.angle_to(to_enemy)

        if abs(angle) <= fan_angle / 2 and to_enemy.length() <= radius:
            if enemy.has_method("take_damage"):
                enemy.take_damage(40)
            if enemy.has_method("apply_knockback"):
                enemy.apply_knockback(to_enemy.normalized(), 200)


class SkillRoarerShockwave:
    extends Skill
