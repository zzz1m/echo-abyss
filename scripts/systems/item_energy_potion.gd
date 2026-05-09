extends Item


func _ready() -> void:
    super._ready()
    item_name = "能量药水"
    description = "恢复30点能量"
    item_type = ItemType.CONSUMABLE
    rarity = Rarity.COMMON
    price = 15
    sell_price = 7
    stackable = true
    max_stack = 10


func use() -> bool:
    var player = get_tree().get_first_node_in_group("player")
    if player and player.has_method("gain_energy"):
        player.gain_energy(30)
        return true
    return false


class EnergyPotion:
    extends Item
