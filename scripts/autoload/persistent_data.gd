## PersistentData
## 永久数据管理器
## 管理Roguelike局外永久进度

extends Node

signal echo_coins_changed(amount: int)
signal character_unlocked(character_id: String)
signal zone_unlocked(zone_id: String)
signal buff_unlocked(buff_id: String)

var echo_coins: int = 0:
    set(value):
        echo_coins = value
        echo_coins_changed.emit(echo_coins)

var unlocked_characters: Array[String] = ["listener"]
var unlocked_zones: Array[String] = ["forest"]
var unlocked_buffs: Array[String] = []
var unlocked_items: Array[String] = []

var best_run_time: float = 0.0
var total_kills: int = 0
var total_deaths: int = 0
var highest_zone_reached: int = 1

var achievements: Array[String] = []

const PERMANENT_BUFFS_COSTS: Dictionary = {
    "health_10": 50,
    "health_20": 75,
    "attack_5": 100,
    "defense_3": 150,
    "speed_20": 200,
    "crit_5": 300,
    "shop_discount": 500,
    "energy_regen": 750,
}

const CHARACTER_COSTS: Dictionary = {
    "roarer": 1000,
    "silent": 1500,
}


func _ready() -> void:
    _load_persistent_data()


func _load_persistent_data() -> void:
    var save_data := SaveManager.load_game(0)
    if save_data.has("permanent"):
        var permanent: Dictionary = save_data["permanent"]
        echo_coins = permanent.get("echo_coins", 0)
        unlocked_characters = permanent.get("unlocked_characters", ["listener"])
        unlocked_zones = permanent.get("unlocked_zones", ["forest"])
        unlocked_buffs = permanent.get("unlocked_buffs", [])
        unlocked_items = permanent.get("unlocked_items", [])
        best_run_time = permanent.get("best_run_time", 0.0)
        total_kills = permanent.get("total_kills", 0)
        total_deaths = permanent.get("total_deaths", 0)
        highest_zone_reached = permanent.get("highest_zone_reached", 1)
        achievements = permanent.get("achievements", [])


func get_save_data() -> Dictionary:
    return {
        "echo_coins": echo_coins,
        "unlocked_characters": unlocked_characters,
        "unlocked_zones": unlocked_zones,
        "unlocked_buffs": unlocked_buffs,
        "unlocked_items": unlocked_items,
        "best_run_time": best_run_time,
        "total_kills": total_kills,
        "total_deaths": total_deaths,
        "highest_zone_reached": highest_zone_reached,
        "achievements": achievements,
    }


func add_echo_coins(amount: int) -> void:
    echo_coins += amount


func spend_echo_coins(amount: int) -> bool:
    if echo_coins >= amount:
        echo_coins -= amount
        return true
    return false


func can_afford(cost: int) -> bool:
    return echo_coins >= cost


func unlock_character(character_id: String) -> bool:
    if character_id in unlocked_characters:
        return false

    var cost: int = CHARACTER_COSTS.get(character_id, 0)
    if cost > 0 and not spend_echo_coins(cost):
        return false

    unlocked_characters.append(character_id)
    character_unlocked.emit(character_id)
    _save_persistent_data()
    return true


func unlock_zone(zone_id: String) -> bool:
    if zone_id in unlocked_zones:
        return false

    unlocked_zones.append(zone_id)
    zone_unlocked.emit(zone_id)
    _save_persistent_data()
    return true


func unlock_buff(buff_id: String) -> bool:
    if buff_id in unlocked_buffs:
        return false

    var cost: int = PERMANENT_BUFFS_COSTS.get(buff_id, 0)
    if cost > 0 and not spend_echo_coins(cost):
        return false

    unlocked_buffs.append(buff_id)
    buff_unlocked.emit(buff_id)
    _save_persistent_data()
    return true


func is_character_unlocked(character_id: String) -> bool:
    return character_id in unlocked_characters


func is_zone_unlocked(zone_id: String) -> bool:
    return zone_id in unlocked_zones


func is_buff_unlocked(buff_id: String) -> bool:
    return buff_id in unlocked_buffs


func has_achievement(achievement_id: String) -> bool:
    return achievement_id in achievements


func unlock_achievement(achievement_id: String) -> void:
    if achievement_id not in achievements:
        achievements.append(achievement_id)
        _save_persistent_data()


func update_best_run_time(run_time: float) -> void:
    if run_time > best_run_time:
        best_run_time = run_time


func increment_kills(count: int = 1) -> void:
    total_kills += count


func increment_deaths() -> void:
    total_deaths += 1


func update_highest_zone(zone_number: int) -> void:
    if zone_number > highest_zone_reached:
        highest_zone_reached = zone_number


func reset_progress() -> void:
    echo_coins = 0
    unlocked_characters = ["listener"]
    unlocked_zones = ["forest"]
    unlocked_buffs = []
    unlocked_items = []
    best_run_time = 0.0
    total_kills = 0
    total_deaths = 0
    highest_zone_reached = 1
    achievements = []
    _save_persistent_data()


func _save_persistent_data() -> void:
    var data := get_save_data()
    SaveManager.current_save_slot = 0
    SaveManager.save_game(0)


func get_playtime_stats() -> Dictionary:
    return {
        "total_kills": total_kills,
        "total_deaths": total_deaths,
        "best_run_time": best_run_time,
        "highest_zone": highest_zone_reached,
        "current_coins": echo_coins,
    }


func get_unlock_progress() -> Dictionary:
    return {
        "characters": {
            "unlocked": unlocked_characters.size(),
            "total": 3,
        },
        "zones": {
            "unlocked": unlocked_zones.size(),
            "total": 5,
        },
        "buffs": {
            "unlocked": unlocked_buffs.size(),
            "total": PERMANENT_BUFFS_COSTS.size(),
        },
    }
