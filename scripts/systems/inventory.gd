extends Node
class_name Inventory

signal item_added(item: Item)
signal item_removed(item: Item)
signal inventory_full
signal item_used(item: Item)

const MAX_SLOTS: int = 20

var items: Array[Item] = []
var slots_used: int = 0


func _ready() -> void:
    items.resize(MAX_SLOTS)


func add_item(item: Item) -> bool:
    var empty_slot = _find_empty_slot()
    if empty_slot == -1:
        inventory_full.emit()
        return false

    items[empty_slot] = item
    slots_used += 1
    item_added.emit(item)
    return true


func remove_item(slot_index: int) -> Item:
    if slot_index < 0 or slot_index >= MAX_SLOTS:
        return null

    var item = items[slot_index]
    if item == null:
        return null

    items[slot_index] = null
    slots_used -= 1
    item_removed.emit(item)
    return item


func use_item(slot_index: int) -> bool:
    var item = items[slot_index]
    if item == null:
        return false

    var success = item.use()
    if success:
        if item.consumable:
            remove_item(slot_index)
        item_used.emit(item)

    return success


func get_item(slot_index: int) -> Item:
    if slot_index < 0 or slot_index >= MAX_SLOTS:
        return null
    return items[slot_index]


func get_all_items() -> Array[Item]:
    return items.filter(func(item): return item != null)


func _find_empty_slot() -> int:
    for i in range(MAX_SLOTS):
        if items[i] == null:
            return i
    return -1


func is_full() -> bool:
    return slots_used >= MAX_SLOTS


func get_item_count() -> int:
    return slots_used


func clear() -> void:
    items.clear()
    items.resize(MAX_SLOTS)
    slots_used = 0
