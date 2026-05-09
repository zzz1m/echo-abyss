extends Node
class_name Item

enum ItemType {
    CONSUMABLE,
    EQUIPMENT,
    KEY_ITEM,
    MATERIAL,
}

enum Rarity {
    COMMON,
    UNCOMMON,
    RARE,
    LEGENDARY,
}

@export var item_name: String = "Item"
@export var description: String = ""
@export var item_type: ItemType = ItemType.CONSUMABLE
@export var rarity: Rarity = Rarity.COMMON
@export var icon: Texture2D
@export var stackable: bool = false
@export var max_stack: int = 99
@export var consumable: bool = true

var current_stack: int = 1
var price: int = 10
var sell_price: int = 5


func _ready() -> void:
    if stackable:
        current_stack = 1


func use() -> bool:
    return false


func get_display_name() -> String:
    var name = item_name
    match rarity:
        Rarity.UNCOMMON:
            name = "[color=#1EFF00]" + name + "[/color]"
        Rarity.RARE:
            name = "[color=#0070DD]" + name + "[/color]"
        Rarity.LEGENDARY:
            name = "[color=#FF8000]" + name + "[/color]"
    return name


func get_rarity_color() -> Color:
    match rarity:
        Rarity.COMMON:
            return Color.WHITE
        Rarity.UNCOMMON:
            return Color("#1EFF00")
        Rarity.RARE:
            return Color("#0070DD")
        Rarity.LEGENDARY:
            return Color("#FF8000")
        _:
            return Color.WHITE


func can_stack() -> bool:
    return stackable and current_stack < max_stack


func add_to_stack(amount: int = 1) -> void:
    if stackable:
        current_stack = min(max_stack, current_stack + amount)


func remove_from_stack(amount: int = 1) -> void:
    if stackable:
        current_stack = max(0, current_stack - amount)


func get_save_data() -> Dictionary:
    return {
        "item_name": item_name,
        "rarity": rarity,
        "current_stack": current_stack,
    }
