## SaveManager
## 存档管理器
## 处理游戏存档的保存和加载

extends Node

signal save_completed(slot: int, success: bool)
signal load_completed(slot: int, success: bool)
signal save_list_updated

const SAVE_PATH := "user://saves/"
const SAVE_FILE := "save_%02d.json"
const CURRENT_VERSION := "1.0.0"

var current_save_slot: int = 1
var save_slots_info: Array[Dictionary] = []


func _ready() -> void:
    DirAccess.make_dir_recursive_absolute(SAVE_PATH)
    refresh_save_list()


func refresh_save_list() -> void:
    save_slots_info.clear()
    for i in range(3):
        var slot := i + 1
        var file_path := SAVE_PATH + SAVE_FILE % slot
        if FileAccess.file_exists(file_path):
            var info := _get_save_info(slot)
            save_slots_info.append(info)
        else:
            save_slots_info.append({"slot": slot, "exists": false})


func _get_save_info(slot: int) -> Dictionary:
    var file_path := SAVE_PATH + SAVE_FILE % slot
    var file := FileAccess.open(file_path, FileAccess.READ)
    if not file:
        return {"slot": slot, "exists": false}

    var json_str := file.get_as_text()
    file.close()

    var json := JSON.new()
    if json.parse(json_str) != OK:
        return {"slot": slot, "exists": false}

    var data: Dictionary = json.data
    return {
        "slot": slot,
        "exists": true,
        "version": data.get("version", "unknown"),
        "timestamp": data.get("timestamp", ""),
        "play_time": data.get("play_time", 0.0),
        "player_name": data.get("player", {}).get("name", "Unknown"),
        "player_class": data.get("player", {}).get("class", "listener"),
        "zone": data.get("progression", {}).get("current_zone", ""),
        "echo_coins": data.get("permanent", {}).get("echo_coins", 0),
    }


func save_game(slot: int = current_save_slot) -> bool:
    var save_data := _collect_save_data()
    var file_path := SAVE_PATH + SAVE_FILE % slot

    var json_str := JSON.stringify(save_data, "\t")
    var file := FileAccess.open(file_path, FileAccess.WRITE)

    if file == null:
        push_error("SaveManager: Failed to save to slot %d: %s" % [slot, FileAccess.get_open_error()])
        save_completed.emit(slot, false)
        return false

    file.store_string(json_str)
    file.close()

    refresh_save_list()
    save_completed.emit(slot, true)
    return true


func load_game(slot: int = current_save_slot) -> Dictionary:
    var file_path := SAVE_PATH + SAVE_FILE % slot

    if not FileAccess.file_exists(file_path):
        load_completed.emit(slot, false)
        return {}

    var file := FileAccess.open(file_path, FileAccess.READ)
    if file == null:
        push_error("SaveManager: Failed to load from slot %d" % slot)
        load_completed.emit(slot, false)
        return {}

    var json_str := file.get_as_text()
    file.close()

    var json := JSON.new()
    if json.parse(json_str) != OK:
        push_error("SaveManager: JSON parse error: " + json.get_error_message())
        load_completed.emit(slot, false)
        return {}

    current_save_slot = slot
    load_completed.emit(slot, true)
    return json.data


func _collect_save_data() -> Dictionary:
    var data := {
        "version": CURRENT_VERSION,
        "timestamp": Time.get_datetime_string_from_system(),
        "play_time": GameManager.game_time,
        "player": {},
        "progression": {},
        "permanent": {},
    }

    if PersistentData:
        data["permanent"] = PersistentData.get_save_data()

    var game := get_tree().current_scene
    if game and game.has_method("get_save_data"):
        data["player"] = game.get_save_data().get("player", {})
        data["progression"] = game.get_save_data().get("progression", {})

    return data


func delete_save(slot: int) -> bool:
    var file_path := SAVE_PATH + SAVE_FILE % slot
    if FileAccess.file_exists(file_path):
        DirAccess.remove_absolute(file_path)
        refresh_save_list()
        return true
    return false


func has_save(slot: int) -> bool:
    return FileAccess.file_exists(SAVE_PATH + SAVE_FILE % slot)


func get_save_info(slot: int) -> Dictionary:
    return save_slots_info[slot - 1] if slot <= save_slots_info.size() else {}


func get_all_save_info() -> Array[Dictionary]:
    return save_slots_info


func quick_save() -> bool:
    return save_game(0)


func quick_load() -> Dictionary:
    if has_save(0):
        return load_game(0)
    return load_game(1)


func _create_autosave() -> void:
    if GameManager.is_playing():
        save_game(-1)


func export_save(slot: int, export_path: String) -> bool:
    var source_path := SAVE_PATH + SAVE_FILE % slot
    if not FileAccess.file_exists(source_path):
        return false

    var source_file := FileAccess.open(source_path, FileAccess.READ)
    if not source_file:
        return false

    var content := source_file.get_as_text()
    source_file.close()

    var export_file := FileAccess.open(export_path, FileAccess.WRITE)
    if not export_file:
        return false

    export_file.store_string(content)
    export_file.close()
    return true


func import_save(import_path: String, slot: int) -> bool:
    if not FileAccess.file_exists(import_path):
        return false

    var source_file := FileAccess.open(import_path, FileAccess.READ)
    if not source_file:
        return false

    var content := source_file.get_as_text()
    source_file.close()

    var target_path := SAVE_PATH + SAVE_FILE % slot
    var target_file := FileAccess.open(target_path, FileAccess.WRITE)
    if not target_file:
        return false

    target_file.store_string(content)
    target_file.close()

    refresh_save_list()
    return true
