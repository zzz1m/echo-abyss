extends Item


func _ready() -> void:
    super._ready()
    item_name = "万能钥匙"
    description = "可以打开任何上锁的门和宝箱"
    item_type = ItemType.KEY_ITEM
    rarity = Rarity.UNCOMMON
    price = 100
    sell_price = 50
    consumable = false


func use() -> bool:
    return false


class KeyItem:
    extends Item
