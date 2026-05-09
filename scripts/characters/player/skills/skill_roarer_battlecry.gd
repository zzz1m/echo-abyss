extends Skill


func _ready() -> void:
    super._ready()
    skill_name = "战斗怒吼"
    description = "发出震耳欲聋的怒吼，提升自身和周围友方单位攻击力"
    energy_cost = 30.0
    cooldown = 10.0
    key = "W"


func _execute_skill(caster: Node) -> void:
    var buff_radius = 200.0
    var buff_duration = 8.0
    var attack_bonus = 15

    var allies = _get_allies_in_range(caster, buff_radius)
    for ally in allies:
        if ally.has_method("apply_buff"):
            ally.apply_buff({
                "type": "attack_up",
                "duration": buff_duration,
                "value": attack_bonus,
            })


func _get_allies_in_range(caster: Node, radius: float) -> Array:
    var allies = []

    var player = get_tree().get_first_node_in_group("player")
    if player and player != caster:
        var distance = caster.global_position.distance_to(player.global_position)
        if distance <= radius:
            allies.append(player)

    return allies


class SkillRoarerBattlecry:
    extends Skill
