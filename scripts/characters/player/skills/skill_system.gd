extends Node
class_name SkillSystem

signal skill_used(skill_key: String, skill_name: String)
signal skill_ready(skill_key: String)
signal skill_cooldown_started(skill_key: String, cooldown: float)
signal skill_failed(skill_key: String, reason: String)

var skills: Dictionary = {}
var cooldowns: Dictionary = {}
var skill_listeners: Array = []


func _ready() -> void:
    _initialize_default_skills()


func _initialize_default_skills() -> void:
    add_skill("Q", SkillListenerEchoWave.new())
    add_skill("W", SkillListenerSonar.new())
    add_skill("E", SkillListenerSilenceZone.new())
    add_skill("R", SkillListenerUltimateResonance.new())


func add_skill(key: String, skill: Skill) -> void:
    skill.key = key
    skills[key] = skill
    cooldowns[key] = 0.0
    add_child(skill)
    _connect_skill_signals(skill, key)


func remove_skill(key: String) -> void:
    if skills.has(key):
        var skill = skills[key]
        skill.queue_free()
        skills.erase(key)
        cooldowns.erase(key)


func get_skill(key: String) -> Skill:
    return skills.get(key)


func _connect_skill_signals(skill: Skill, key: String) -> void:
    skill.skill_used.connect(_on_skill_used.bind(key))
    skill.skill_ready.connect(_on_skill_ready.bind(key))
    skill.skill_cooldown_started.connect(_on_skill_cooldown_started.bind(key))


func _on_skill_used(skill_name: String, key: String) -> void:
    skill_used.emit(key, skill_name)


func _on_skill_ready(key: String) -> void:
    skill_ready.emit(key)


func _on_skill_cooldown_started(key: String, cooldown: float) -> void:
    skill_cooldown_started.emit(key, cooldown)


func can_use_skill(key: String, energy: float) -> bool:
    var skill = skills.get(key)
    if skill == null:
        skill_failed.emit(key, "Skill not found")
        return false

    if cooldowns[key] > 0:
        skill_failed.emit(key, "Skill on cooldown")
        return false

    if energy < skill.energy_cost:
        skill_failed.emit(key, "Not enough energy")
        return false

    return true


func use_skill(key: String, caster: Node) -> bool:
    var skill = skills.get(key)
    if skill == null:
        return false

    if not can_use_skill(key, caster.energy):
        return false

    if skill.use(caster):
        cooldowns[key] = skill.cooldown
        return true

    return false


func _process(delta: float) -> void:
    for key in cooldowns:
        if cooldowns[key] > 0:
            cooldowns[key] = max(0, cooldowns[key] - delta)
            if cooldowns[key] <= 0:
                var skill = skills.get(key)
                if skill:
                    skill.is_ready = true
                    skill_ready.emit(key)


func get_cooldown_percent(key: String) -> float:
    var skill = skills.get(key)
    if skill == null or skill.cooldown <= 0:
        return 1.0
    return 1.0 - (cooldowns[key] / skill.cooldown)


func get_all_skills() -> Array:
    return skills.values()
