extends Node
class_name AchievementSystem

signal achievement_unlocked(achievement_id: String)
signal achievement_progress_updated(achievement_id: String, progress: float)
signal all_achievements_unlocked

enum AchievementCategory {
    COMBAT,
    EXPLORATION,
    SKILL,
    STORY,
    SPECIAL,
}

var achievements: Dictionary = {}
var unlocked_achievements: Array = []


func _ready() -> void:
    add_to_group("achievement_system")
    _initialize_achievements()


func _initialize_achievements() -> void:
    achievements = {
        "first_blood": {
            "name": "初战告捷",
            "description": "击败第一个敌人",
            "category": AchievementCategory.COMBAT,
            "requirement": {"type": "enemies_killed", "count": 1},
            "reward": {"experience": 50},
        },
        "slayer_10": {
            "name": "杀手",
            "description": "击败10个敌人",
            "category": AchievementCategory.COMBAT,
            "requirement": {"type": "enemies_killed", "count": 10},
            "reward": {"experience": 200},
        },
        "slayer_50": {
            "name": "屠戮者",
            "description": "击败50个敌人",
            "category": AchievementCategory.COMBAT,
            "requirement": {"type": "enemies_killed", "count": 50},
            "reward": {"experience": 500},
        },
        "slayer_100": {
            "name": "死亡使者",
            "description": "击败100个敌人",
            "category": AchievementCategory.COMBAT,
            "requirement": {"type": "enemies_killed", "count": 100},
            "reward": {"experience": 1000},
        },
        "boss_hunter": {
            "name": "BOSS猎人",
            "description": "击败第一个BOSS",
            "category": AchievementCategory.COMBAT,
            "requirement": {"type": "bosses_killed", "count": 1},
            "reward": {"experience": 500},
        },
        "zone_explorer": {
            "name": "区域探索者",
            "description": "进入第一个区域",
            "category": AchievementCategory.EXPLORATION,
            "requirement": {"type": "zones_entered", "count": 1},
            "reward": {"experience": 30},
        },
        "forest_cleared": {
            "name": "森林征服者",
            "description": "通关回响森林",
            "category": AchievementCategory.EXPLORATION,
            "requirement": {"type": "zones_cleared", "count": 1},
            "reward": {"experience": 300},
        },
        "all_zones": {
            "name": "深渊行者",
            "description": "进入所有区域",
            "category": AchievementCategory.EXPLORATION,
            "requirement": {"type": "zones_entered", "count": 5},
            "reward": {"experience": 1000},
        },
        "skill_master": {
            "name": "技能大师",
            "description": "使用技能100次",
            "category": AchievementCategory.SKILL,
            "requirement": {"type": "skills_used", "count": 100},
            "reward": {"experience": 500},
        },
        "ultimate_power": {
            "name": "终极力量",
            "description": "使用终极技能10次",
            "category": AchievementCategory.SKILL,
            "requirement": {"type": "ultimates_used", "count": 10},
            "reward": {"experience": 300},
        },
        "no_damage": {
            "name": "完美闪避",
            "description": "不受伤通过一个房间",
            "category": AchievementCategory.SPECIAL,
            "requirement": {"type": "rooms_cleared_no_damage", "count": 1},
            "reward": {"experience": 200},
        },
        "speed_runner": {
            "name": "速通者",
            "description": "5分钟内通关森林区域",
            "category": AchievementCategory.SPECIAL,
            "requirement": {"type": "zone_clear_time", "zone": "forest", "time": 300},
            "reward": {"experience": 500},
        },
        "true_ending": {
            "name": "真结局",
            "description": "达成真结局",
            "category": AchievementCategory.STORY,
            "requirement": {"type": "ending", "ending": "true"},
            "reward": {"experience": 2000},
        },
        "good_ending": {
            "name": "好结局",
            "description": "达成好结局",
            "category": AchievementCategory.STORY,
            "requirement": {"type": "ending", "ending": "good"},
            "reward": {"experience": 1000},
        },
    }


func check_achievement(event_type: String, value: Variant = null) -> void:
    for achievement_id in achievements.keys():
        if achievement_id in unlocked_achievements:
            continue

        var achievement = achievements[achievement_id]
        var requirement = achievement["requirement"]

        if requirement["type"] != event_type:
            continue

        var current_progress = PersistentData.get_stat(event_type, 0)
        var required_count = requirement.get("count", 1)

        if typeof(current_progress) == TYPE_INT and current_progress >= required_count:
            unlock_achievement(achievement_id)
        elif typeof(current_progress) == TYPE_INT:
            var progress = float(current_progress) / float(required_count)
            achievement_progress_updated.emit(achievement_id, progress)


func unlock_achievement(achievement_id: String) -> void:
    if achievement_id in unlocked_achievements:
        return

    if not achievements.has(achievement_id):
        return

    unlocked_achievements.append(achievement_id)

    var achievement = achievements[achievement_id]
    achievement_unlocked.emit(achievement_id)

    _grant_reward(achievement["reward"])

    PersistentData.unlocked_achievements = unlocked_achievements

    _show_achievement_popup(achievement)


func _grant_reward(reward: Dictionary) -> void:
    if reward.has("experience"):
        var player = get_tree().get_first_node_in_group("player")
        if player and player.has_method("gain_experience"):
            player.gain_experience(reward["experience"])


func _show_achievement_popup(achievement: Dictionary) -> void:
    var popup = preload("res://scenes/ui/hud/achievement_popup.tscn").instantiate()
    popup.setup_achievement(achievement["name"], achievement["description"])
    get_tree().current_scene.add_child(popup)


func is_achievement_unlocked(achievement_id: String) -> bool:
    return achievement_id in unlocked_achievements


func get_achievements_by_category(category: AchievementCategory) -> Array:
    var result = []
    for achievement_id in achievements.keys():
        if achievements[achievement_id]["category"] == category:
            result.append({
                "id": achievement_id,
                "achievement": achievements[achievement_id],
                "unlocked": achievement_id in unlocked_achievements,
            })
    return result


func get_total_achievements() -> int:
    return achievements.size()


func get_unlocked_count() -> int:
    return unlocked_achievements.size()


func get_completion_percent() -> float:
    if achievements.is_empty():
        return 0.0
    return float(unlocked_achievements.size()) / float(achievements.size()) * 100.0


func reset_progress() -> void:
    unlocked_achievements.clear()
    PersistentData.unlocked_achievements = []
