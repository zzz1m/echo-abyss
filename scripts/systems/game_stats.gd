extends Node
class_name GameStats

signal stat_updated(stat_name: String, value: Variant)
signal stats_reset

var stats: Dictionary = {}


func _ready() -> void:
    add_to_group("game_stats")
    _initialize_stats()


func _initialize_stats() -> void:
    stats = {
        "play_time": 0.0,
        "enemies_killed": 0,
        "bosses_killed": 0,
        "damage_dealt": 0,
        "damage_taken": 0,
        "healing_done": 0,
        "skills_used": 0,
        "ultimates_used": 0,
        "items_used": 0,
        "gold_earned": 0,
        "gold_spent": 0,
        "rooms_cleared": 0,
        "zones_cleared": 0,
        "deaths": 0,
        "highest_zone_reached": 0,
        "longest_combo": 0,
        "current_combo": 0,
        "critical_hits": 0,
        "dodges": 0,
        "perfect_rooms": 0,
    }


func update_stat(stat_name: String, value: Variant) -> void:
    if not stats.has(stat_name):
        return

    var old_value = stats[stat_name]

    match typeof(value):
        TYPE_INT:
            stats[stat_name] = old_value + value
        TYPE_FLOAT:
            stats[stat_name] = old_value + value
        TYPE_STRING:
            stats[stat_name] = value

    stat_updated.emit(stat_name, stats[stat_name])
    PersistentData.update_stat(stat_name, stats[stat_name])


func set_stat(stat_name: String, value: Variant) -> void:
    if stats.has(stat_name):
        stats[stat_name] = value
        stat_updated.emit(stat_name, value)
        PersistentData.update_stat(stat_name, value)


func get_stat(stat_name: String, default: Variant = null) -> Variant:
    return stats.get(stat_name, default)


func increment_stat(stat_name: String, amount: int = 1) -> void:
    update_stat(stat_name, amount)


func record_enemy_kill() -> void:
    increment_stat("enemies_killed")
    increment_combo()


func record_boss_kill() -> void:
    increment_stat("bosses_killed")


func record_damage_dealt(amount: int) -> void:
    increment_stat("damage_dealt", amount)


func record_damage_taken(amount: int) -> void:
    increment_stat("damage_taken", amount)
    reset_combo()


func record_healing(amount: int) -> void:
    increment_stat("healing_done", amount)


func record_skill_use(is_ultimate: bool = false) -> void:
    increment_stat("skills_used")
    if is_ultimate:
        increment_stat("ultimates_used")


func record_item_use() -> void:
    increment_stat("items_used")


func record_gold_earned(amount: int) -> void:
    increment_stat("gold_earned", amount)


func record_gold_spent(amount: int) -> void:
    increment_stat("gold_spent", amount)


func record_room_cleared() -> void:
    increment_stat("rooms_cleared")


func record_zone_cleared() -> void:
    increment_stat("zones_cleared")


func record_death() -> void:
    increment_stat("deaths")
    reset_combo()


func record_dodge() -> void:
    increment_stat("dodges")


func increment_combo() -> void:
    var current = stats.get("current_combo", 0) + 1
    set_stat("current_combo", current)

    if current > stats.get("longest_combo", 0):
        set_stat("longest_combo", current)


func reset_combo() -> void:
    set_stat("current_combo", 0)


func record_critical_hit() -> void:
    increment_stat("critical_hits")


func record_perfect_room() -> void:
    increment_stat("perfect_rooms")


func update_play_time(delta: float) -> void:
    increment_stat("play_time", delta)


func get_play_time_formatted() -> String:
    var total_seconds = int(stats.get("play_time", 0))
    var hours = total_seconds / 3600
    var minutes = (total_seconds % 3600) / 60
    var seconds = total_seconds % 60
    return "%02d:%02d:%02d" % [hours, minutes, seconds]


func get_damage_dealt_per_second() -> float:
    var play_time = stats.get("play_time", 1.0)
    if play_time <= 0:
        return 0.0
    return stats.get("damage_dealt", 0) / play_time


func get_kill_per_minute() -> float:
    var play_time = stats.get("play_time", 1.0)
    if play_time <= 0:
        return 0.0
    return stats.get("enemies_killed", 0) / (play_time / 60.0)


func get_dps() -> Dictionary:
    return {
        "damage_per_second": get_damage_dealt_per_second(),
        "kills_per_minute": get_kill_per_minute(),
        "crit_rate": _calculate_crit_rate(),
    }


func _calculate_crit_rate() -> float:
    var total_attacks = stats.get("damage_dealt", 0)
    if total_attacks <= 0:
        return 0.0
    var crits = stats.get("critical_hits", 0)
    return float(crits) / float(total_attacks) * 100.0


func get_all_stats() -> Dictionary:
    return stats.duplicate(true)


func get_summary() -> String:
    var summary = []
    summary.append("=== 游戏统计 ===")
    summary.append("游戏时间: %s" % get_play_time_formatted())
    summary.append("击杀敌人: %d" % stats.get("enemies_killed", 0))
    summary.append("击杀BOSS: %d" % stats.get("bosses_killed", 0))
    summary.append("造成伤害: %d" % stats.get("damage_dealt", 0))
    summary.append("承受伤害: %d" % stats.get("damage_taken", 0))
    summary.append("治疗量: %d" % stats.get("healing_done", 0))
    summary.append("技能使用: %d" % stats.get("skills_used", 0))
    summary.append("终极技能: %d" % stats.get("ultimates_used", 0))
    summary.append("最长连击: %d" % stats.get("longest_combo", 0))
    summary.append("死亡次数: %d" % stats.get("deaths", 0))
    summary.append("闪避次数: %d" % stats.get("dodges", 0))
    summary.append("================")

    return "\n".join(summary)


func reset_all_stats() -> void:
    _initialize_stats()
    stats_reset.emit()
    PersistentData.reset_stats()


func save_stats() -> void:
    PersistentData.save_all_stats(stats)


func load_stats(saved_stats: Dictionary) -> void:
    for stat_name in saved_stats.keys():
        if stat_name in stats:
            stats[stat_name] = saved_stats[stat_name]
