extends Node
class_name StatusEffect

enum EffectType {
    STUN,
    SLOW,
    BURN,
    POISON,
    SILENCE,
    WEAKEN,
    BLEED,
    REGENERATION,
}

var effect_type: EffectType = EffectType.STUN
var duration: float = 3.0
var intensity: float = 1.0
var source: Node = null
var is_active: bool = true

var current_duration: float = 0.0
var tick_timer: float = 0.0


func _ready() -> void:
    current_duration = duration
    _on_apply()


func _process(delta: float) -> void:
    if not is_active:
        return

    current_duration -= delta
    tick_timer -= delta

    if tick_timer <= 0:
        _on_tick()
        tick_timer = _get_tick_interval()

    if current_duration <= 0:
        _on_expire()
        queue_free()


func _on_apply() -> void:
    match effect_type:
        EffectType.STUN:
            _apply_stun()
        EffectType.SLOW:
            _apply_slow()
        EffectType.BURN:
            _apply_burn()
        EffectType.POISON:
            _apply_poison()
        EffectType.SILENCE:
            _apply_silence()
        EffectType.WEAKEN:
            _apply_weaken()
        EffectType.REGENERATION:
            _apply_regeneration()


func _on_tick() -> void:
    match effect_type:
        EffectType.BURN:
            _tick_burn()
        EffectType.POISON:
            _tick_poison()
        EffectType.REGENERATION:
            _tick_regeneration()
        EffectType.BLEED:
            _tick_bleed()


func _on_expire() -> void:
    _remove_effect()


func _apply_stun() -> void:
    if source and source.has_method("apply_stun"):
        source.apply_stun(duration)


func _apply_slow() -> void:
    if source:
        source.speed *= (1.0 - intensity)


func _apply_burn() -> void:
    tick_timer = 1.0


func _tick_burn() -> void:
    if source and source.has_method("take_damage"):
        source.take_damage(int(intensity * 5), CombatManager.DamageType.ECHO)


func _apply_poison() -> void:
    tick_timer = 2.0


func _tick_poison() -> void:
    if source and source.has_method("take_damage"):
        source.take_damage(int(intensity * 3), CombatManager.DamageType.POISON)


func _apply_silence() -> void:
    if source:
        source.is_silenced = true


func _apply_weaken() -> void:
    if source and source.has_method("get_attack_power"):
        source.attack_power_multiplier = (1.0 - intensity)


func _apply_regeneration() -> void:
    tick_timer = 2.0


func _tick_regeneration() -> void:
    if source and source.has_method("heal"):
        source.heal(int(intensity * 10))


func _remove_effect() -> void:
    is_active = false


func _get_tick_interval() -> float:
    return 1.0


func extend_duration(additional_time: float) -> void:
    current_duration += additional_time


func get_remaining_duration() -> float:
    return current_duration


func is_expired() -> bool:
    return current_duration <= 0
