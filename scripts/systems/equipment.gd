extends Node
class_name Equipment

enum EquipmentSlot {
    WEAPON,
    ARMOR,
    ACCESSORY_1,
    ACCESSORY_2,
}

@export var slot: EquipmentSlot = EquipmentSlot.WEAPON
@export var item_name: String = "装备"
@export var description: String = ""
@export var rarity: Item.Rarity = Item.Rarity.COMMON
@export var icon: Texture2D

@export var attack_bonus: int = 0
@export var defense_bonus: int = 0
@export var health_bonus: int = 0
@export var energy_bonus: float = 0.0
@export var speed_bonus: float = 0.0
@export var crit_chance_bonus: float = 0.0
@export var crit_multiplier_bonus: float = 0.0


func _ready() -> void:
    item_type = ItemType.EQUIPMENT


func equip(character: Node) -> void:
    if character.has_method("add_equipment_stats"):
        character.add_equipment_stats({
            "attack": attack_bonus,
            "defense": defense_bonus,
            "health": health_bonus,
            "energy": energy_bonus,
            "speed": speed_bonus,
            "crit_chance": crit_chance_bonus,
            "crit_multiplier": crit_multiplier_bonus,
        })


func unequip(character: Node) -> void:
    if character.has_method("remove_equipment_stats"):
        character.remove_equipment_stats({
            "attack": attack_bonus,
            "defense": defense_bonus,
            "health": health_bonus,
            "energy": energy_bonus,
            "speed": speed_bonus,
            "crit_chance": crit_chance_bonus,
            "crit_multiplier": crit_multiplier_bonus,
        })
