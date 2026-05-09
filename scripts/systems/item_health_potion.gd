extends Item


func _ready() -> void:
    super._ready()
    item_name = "生命药水"
    description = "恢复50点生命值"
    item_type = ItemType.CONSUMABLE
    rarity = Rarity.COMMON
    price = 20
    sell_price = 10
    stackable = true
    max_stack = 10


func use() -> bool:
    var player = get_tree().get_first_node_in_group("player")
    if player and player.has_method("heal"):
        player.heal(50)
        return true
    return false


class HealthPotion:
    extends Item
