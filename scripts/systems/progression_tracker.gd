extends Node

signal zone_started(zone_name: String)
signal boss_appeared(boss_name: String)
signal boss_defeated(boss_name: String)
signal zone_cleared(zone_name: String)

var current_zone: String = "forest"
var zones_cleared: Array[String] = []
var current_boss: String = ""
var bosses_defeated: Array[String] = []

var zone_order: Array[String] = [
    "forest",
    "lava",
    "deepsea",
    "bone",
    "abyss"
]


func _ready() -> void:
    add_to_group("progression_tracker")


func start_zone(zone_name: String) -> void:
    current_zone = zone_name
    zone_started.emit(zone_name)


func trigger_boss(boss_name: String) -> void:
    current_boss = boss_name
    boss_appeared.emit(boss_name)


func on_boss_defeated() -> void:
    if current_boss != "":
        bosses_defeated.append(current_boss)
        boss_defeated.emit(current_boss)
        current_boss = ""


func on_zone_cleared() -> void:
    if current_zone != "" and current_zone not in zones_cleared:
        zones_cleared.append(current_zone)
        zone_cleared.emit(current_zone)


func is_all_zones_cleared() -> bool:
    return zones_cleared.size() >= zone_order.size()


func get_current_zone_index() -> int:
    return zone_order.find(current_zone)


func get_zones_cleared_count() -> int:
    return zones_cleared.size()


func get_progression_percent() -> float:
    return float(zones_cleared.size()) / float(zone_order.size()) * 100.0


func get_save_data() -> Dictionary:
    return {
        "current_zone": current_zone,
        "zones_cleared": zones_cleared,
        "current_boss": current_boss,
        "bosses_defeated": bosses_defeated,
    }


func load_save_data(data: Dictionary) -> void:
    current_zone = data.get("current_zone", "forest")
    zones_cleared = data.get("zones_cleared", [])
    current_boss = data.get("current_boss", "")
    bosses_defeated = data.get("bosses_defeated", [])
