extends NPC

@export var shop_items: Array[Dictionary] = []

var echo_coins: int = 0


func _ready() -> void:
    super._ready()
    npc_name = "elina"
    display_name = "艾琳娜"
    dialogue_lines = [
        "欢迎来到我的商店，旅行者。",
        "我这里有各种有用的物品，也许能帮到你。",
    ]
    _setup_shop_items()


func _setup_shop_items() -> void:
    shop_items = [
        {
            "item_name": "生命药水",
            "price": 20,
            "description": "恢复50点生命值",
        },
        {
            "item_name": "能量药水",
            "price": 15,
            "description": "恢复30点能量",
        },
        {
            "item_name": "护甲碎片",
            "price": 50,
            "description": "强化护甲的素材",
        },
        {
            "item_name": "力量宝石",
            "price": 100,
            "description": "增加攻击力",
        },
    ]


func interact() -> void:
    if not is_interactable:
        return

    has_interacted = true
    interacted.emit(self)
    _show_shop_ui()


func _show_shop_ui() -> void:
    var shop_ui = preload("res://scenes/ui/shop/shop_ui.tscn").instantiate()
    shop_ui.setup_shop(self)
    get_tree().current_scene.add_child(shop_ui)


func buy_item(item_index: int) -> bool:
    if item_index < 0 or item_index >= shop_items.size():
        return false

    var item_data = shop_items[item_index]
    var price = item_data.price

    if PersistentData.echo_coins >= price:
        PersistentData.echo_coins -= price
        _grant_item(item_data)
        return true

    return false


func sell_item(item: Item) -> bool:
    if item == null:
        return false

    var sell_price = item.sell_price * item.current_stack
    PersistentData.echo_coins += sell_price
    return true


func _grant_item(item_data: Dictionary) -> void:
    var player = get_tree().get_first_node_in_group("player")
    if player and player.has_method("add_item"):
        var item = _create_item(item_data.item_name)
        if item:
            player.add_item(item)


func _create_item(item_name: String) -> Item:
    match item_name:
        "生命药水":
            return ItemHealthPotion.new()
        "能量药水":
            return ItemEnergyPotion.new()
        _:
            return null
