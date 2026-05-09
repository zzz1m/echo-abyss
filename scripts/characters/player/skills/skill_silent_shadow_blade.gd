extends Skill


func _ready() -> void:
    super._ready()
    skill_name = "暗影之刃"
    description = "快速穿梭于敌人之间，造成多次伤害"
    energy_cost = 20.0
    cooldown = 4.0
    key = "Q"


func _execute_skill(caster: Node) -> void:
    var dash_distance = 200.0
    var damage_per_hit = 15
    var max_targets = 3

    var enemies = _get_nearest_enemies(caster, max_targets)
    var start_pos = caster.global_position

    for i in range(min(enemies.size(), max_targets)):
        var enemy = enemies[i]
        if enemy and enemy.has_method("take_damage"):
            caster.global_position = enemy.global_position
            enemy.take_damage(damage_per_hit)

        await get_tree().create_timer(0.1).timeout

    caster.global_position = start_pos


func _get_nearest_enemies(caster: Node, count: int) -> Array:
    var enemies = get_tree().get_nodes_in_group("enemy")
    enemies.sort_custom(func(a, b):
        return caster.global_position.distance_to(a.global_position) < \
               caster.global_position.distance_to(b.global_position)
    )
    return enemies.slice(0, count)


class SkillSilentShadowBlade:
    extends Skill
