extends Node
class_name CombatManager

enum DamageType {
    PHYSICAL,
    ECHO,
    SHADOW,
    PURE,
}

enum StatusEffectType {
    STUN,
    SLOW,
    BURN,
    POISON,
    SILENCE,
    WEAKEN,
}

var damage_modifiers: Dictionary = {
    DamageType.PHYSICAL: 1.0,
    DamageType.ECHO: 1.0,
    DamageType.SHADOW: 1.0,
    DamageType.PURE: 1.0,
}


func _ready() -> void:
    add_to_group("combat_manager")


func calculate_damage(
    attacker: Node,
    defender: Node,
    base_damage: int,
    damage_type: DamageType = DamageType.PHYSICAL
) -> Dictionary:

    var final_damage := float(base_damage)

    if attacker.has_method("get_attack_power"):
        final_damage += attacker.get_attack_power()

    if defender.has_method("get_defense"):
        var defense = defender.get_defense()
        final_damage = max(1, final_damage - defense)

    if defender.has_method("get_damage_resistance"):
        var resistance = defender.get_damage_resistance(damage_type)
        final_damage *= resistance

    final_damage *= damage_modifiers.get(damage_type, 1.0)

    if attacker.has_method("get_crit_chance"):
        var crit_chance = attacker.get_crit_chance()
        if _roll_crit(crit_chance):
            final_damage *= attacker.get_crit_multiplier() if attacker.has_method("get_crit_multiplier") else 1.5

    var variance = randf_range(0.9, 1.1)
    final_damage *= variance

    return {
        "damage": int(final_damage),
        "type": damage_type,
        "is_critical": false,
    }


func _roll_crit(crit_chance: float) -> bool:
    return randf() < crit_chance


func apply_status_effect(
    target: Node,
    effect_type: StatusEffectType,
    duration: float,
    intensity: float = 1.0
) -> void:
    if not target.has_method("add_status_effect"):
        return

    var effect = StatusEffect.new()
    effect.effect_type = effect_type
    effect.duration = duration
    effect.intensity = intensity
    effect.source = self

    target.add_status_effect(effect)


func calculate_healing(
    healer: Node,
    base_heal: int,
    heal_multiplier: float = 1.0
) -> int:
    var final_heal := float(base_heal)

    if healer.has_method("get_heal_power"):
        final_heal += healer.get_heal_power()

    final_heal *= heal_multiplier

    return int(final_heal)


func is_in_combat(entity: Node) -> bool:
    return entity.get("is_in_combat") if "is_in_combat" in entity else false


func start_combat(entity: Node) -> void:
    if "is_in_combat" in entity:
        entity.is_in_combat = true


func end_combat(entity: Node) -> void:
    if "is_in_combat" in entity:
        entity.is_in_combat = false
