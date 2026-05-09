extends Control
class_name ShopUI

signal shop_closed

@onready var item_list: ItemList = $ShopContainer/ItemList
@onready var currency_label: Label = $ShopContainer/CurrencyDisplay
@onready var buy_button: Button = $ShopContainer/ButtonContainer/BuyButton
@onready var sell_button: Button = $ShopContainer/ButtonContainer/SellButton
@onready var close_button: Button = $ShopContainer/ButtonContainer/CloseButton

var shop_owner: Node = null
var selected_index: int = -1


func _ready() -> void:
    _connect_signals()
    _update_currency_display()


func _connect_signals() -> void:
    buy_button.pressed.connect(_on_buy_pressed)
    sell_button.pressed.connect(_on_sell_pressed)
    close_button.pressed.connect(_on_close_pressed)
    item_list.item_selected.connect(_on_item_selected)


func setup_shop(npc: Node) -> void:
    shop_owner = npc
    _populate_items()


func _populate_items() -> void:
    item_list.clear()

    if shop_owner and shop_owner.has("shop_items"):
        for item_data in shop_owner.shop_items:
            var display_text = "%s - %d 金币\n%s" % [
                item_data.item_name,
                item_data.price,
                item_data.description,
            ]
            item_list.add_item(display_text)


func _update_currency_display() -> void:
    var coins = PersistentData.echo_coins if PersistentData else 0
    currency_label.text = "回响金币: %d" % coins


func _on_item_selected(index: int) -> void:
    selected_index = index


func _on_buy_pressed() -> void:
    if selected_index < 0:
        return

    if shop_owner and shop_owner.has_method("buy_item"):
        var success = shop_owner.buy_item(selected_index)
        if success:
            _update_currency_display()
            _show_purchase_feedback(true)
        else:
            _show_purchase_feedback(false)


func _on_sell_pressed() -> void:
    pass


func _on_close_pressed() -> void:
    shop_closed.emit()
    queue_free()


func _show_purchase_feedback(success: bool) -> void:
    if success:
        print("购买成功！")
    else:
        print("金币不足！")
