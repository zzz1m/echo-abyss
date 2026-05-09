extends Node
class_name LevelGenerator

signal room_generated(room_index: int)
signal level_completed
signal boss_spawned

enum ZoneType {
    FOREST,
    LAVA,
    DEEPSEA,
    BONE,
    ABYSS,
}

enum RoomType {
    COMBAT,
    BOSS,
    SHOP,
    EVENT,
    REST,
}

@export var current_zone: ZoneType = ZoneType.FOREST
@export var total_rooms: int = 10
@export var boss_room_index: int = 10

var current_room: int = 0
var generated_rooms: Array = []


func _ready() -> void:
    add_to_group("level_generator")


func generate_level(zone: ZoneType, room_count: int) -> void:
    current_zone = zone
    total_rooms = room_count
    boss_room_index = room_count
    current_room = 0
    generated_rooms.clear()


func get_next_room() -> Dictionary:
    current_room += 1

    var room_type = _determine_room_type(current_room)
    var room_data = _generate_room_data(room_type)

    generated_rooms.append(room_data)
    room_generated.emit(current_room)

    return room_data


func _determine_room_type(room_index: int) -> RoomType:
    if room_index == boss_room_index:
        return RoomType.BOSS

    var rand = randf()
    if rand < 0.65:
        return RoomType.COMBAT
    elif rand < 0.75:
        return RoomType.SHOP
    elif rand < 0.85:
        return RoomType.EVENT
    else:
        return RoomType.REST


func _generate_room_data(room_type: RoomType) -> Dictionary:
    var data = {
        "room_index": current_room,
        "room_type": room_type,
        "enemies": [],
        "items": [],
        "exits": [],
    }

    match room_type:
        RoomType.COMBAT:
            data.enemies = _generate_combat_enemies()
        RoomType.BOSS:
            data.enemies = _generate_boss()
            boss_spawned.emit()
        RoomType.SHOP:
            data.items = _generate_shop_items()
        RoomType.EVENT:
            data = _generate_event_room(data)
        RoomType.REST:
            data = _generate_rest_room(data)

    return data


func _generate_combat_enemies() -> Array:
    var enemies = []
    var enemy_count = randi() % 3 + 1

    for i in range(enemy_count):
        var enemy_type = _get_random_enemy_type()
        enemies.append({
            "type": enemy_type,
            "position": _get_random_spawn_position(),
        })

    return enemies


func _get_random_enemy_type() -> String:
    match current_zone:
        ZoneType.FOREST:
            var types = ["bat", "crawler"]
            return types[randi() % types.size()]
        ZoneType.LAVA:
            var types = ["bat", "specter"]
            return types[randi() % types.size()]
        ZoneType.DEEPSEA:
            var types = ["crawler", "specter"]
            return types[randi() % types.size()]
        ZoneType.BONE:
            var types = ["specter"]
            return types[randi() % types.size()]
        _:
            return "bat"


func _generate_boss() -> Array:
    var boss_type = _get_zone_boss()
    return [{
        "type": boss_type,
        "position": Vector2(400, 300),
        "is_boss": true,
    }]


func _get_zone_boss() -> String:
    match current_zone:
        ZoneType.FOREST:
            return "boss_warden"
        ZoneType.LAVA:
            return "boss_soundwave"
        ZoneType.DEEPSEA:
            return "boss_shadow"
        ZoneType.BONE:
            return "boss_void"
        _:
            return "boss_warden"


func _generate_shop_items() -> Array:
    var items = []
    var item_count = randi() % 3 + 2

    for i in range(item_count):
        items.append({
            "type": "shop_item",
            "position": _get_random_spawn_position(),
        })

    return items


func _generate_event_room(data: Dictionary) -> Dictionary:
    return data


func _generate_rest_room(data: Dictionary) -> Dictionary:
    data.heal_player = true
    return data


func _get_random_spawn_position() -> Vector2:
    var x = randf_range(200, 600)
    var y = randf_range(200, 400)
    return Vector2(x, y)


func is_level_complete() -> bool:
    return current_room >= total_rooms


func get_progress() -> float:
    if total_rooms <= 0:
        return 0.0
    return float(current_room) / float(total_rooms)
