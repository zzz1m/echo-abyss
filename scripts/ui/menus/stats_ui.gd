extends Control
class_name StatsUI

signal ui_closed

@onready var stats_list: VBoxContainer = $Container/ScrollContainer/StatsList
@onready var close_button: Button = $Container/CloseButton


func _ready() -> void:
    close_button.pressed.connect(_on_close_pressed)
    _populate_stats()


func _populate_stats() -> void:
    for child in stats_list.get_children():
        child.queue_free()

    var game_stats = get_node_or_null("/root/GameStats")
    if not game_stats:
        return

    _add_stat_row("游戏时间", game_stats.get_play_time_formatted())
    _add_stat_row("击杀敌人", str(game_stats.get_stat("enemies_killed", 0)))
    _add_stat_row("击杀BOSS", str(game_stats.get_stat("bosses_killed", 0)))
    _add_stat_row("造成伤害", str(game_stats.get_stat("damage_dealt", 0)))
    _add_stat_row("承受伤害", str(game_stats.get_stat("damage_taken", 0)))
    _add_stat_row("治疗量", str(game_stats.get_stat("healing_done", 0)))
    _add_stat_row("技能使用", str(game_stats.get_stat("skills_used", 0)))
    _add_stat_row("终极技能", str(game_stats.get_stat("ultimates_used", 0)))
    _add_stat_row("物品使用", str(game_stats.get_stat("items_used", 0)))
    _add_stat_row("获得金币", str(game_stats.get_stat("gold_earned", 0)))
    _add_stat_row("花费金币", str(game_stats.get_stat("gold_spent", 0)))
    _add_stat_row("通关房间", str(game_stats.get_stat("rooms_cleared", 0)))
    _add_stat_row("通关区域", str(game_stats.get_stat("zones_cleared", 0)))
    _add_stat_row("最长连击", str(game_stats.get_stat("longest_combo", 0)))
    _add_stat_row("死亡次数", str(game_stats.get_stat("deaths", 0)))
    _add_stat_row("闪避次数", str(game_stats.get_stat("dodges", 0)))
    _add_stat_row("暴击次数", str(game_stats.get_stat("critical_hits", 0)))
    _add_stat_row("完美房间", str(game_stats.get_stat("perfect_rooms", 0)))


func _add_stat_row(label: String, value: String) -> HBoxContainer:
    var container = HBoxContainer.new()

    var label_text = Label.new()
    label_text.text = label
    label_text.size_flags_horizontal = 3
    label_text.add_theme_color_override("font_color", Color(0.8, 0.8, 0.8))
    container.add_child(label_text)

    var value_text = Label.new()
    value_text.text = value
    value_text.add_theme_color_override("font_color", Color(0, 0.8, 1))
    value_text.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
    container.add_child(value_text)

    stats_list.add_child(container)
    return container


func _on_close_pressed() -> void:
    ui_closed.emit()
    queue_free()
