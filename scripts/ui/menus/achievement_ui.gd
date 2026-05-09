extends Control
class_name AchievementUI

signal ui_closed

@onready var progress_label: Label = $Container/ProgressLabel
@onready var achievement_list: VBoxContainer = $Container/Tabs/All/AchievementList
@onready var close_button: Button = $Container/CloseButton


func _ready() -> void:
    close_button.pressed.connect(_on_close_pressed)
    _refresh_achievements()


func _refresh_achievements() -> void:
    var achievement_system = get_node_or_null("/root/AchievementSystem")
    if not achievement_system:
        return

    for child in achievement_list.get_children():
        child.queue_free()

    for achievement_id in achievement_system.achievements.keys():
        var achievement = achievement_system.achievements[achievement_id]
        var is_unlocked = achievement_system.is_achievement_unlocked(achievement_id)

        var achievement_item = _create_achievement_item(
            achievement["name"],
            achievement["description"],
            is_unlocked
        )
        achievement_list.add_child(achievement_item)

    var total = achievement_system.get_total_achievements()
    var unlocked = achievement_system.get_unlocked_count()
    progress_label.text = "%d / %d 已解锁" % [unlocked, total]


func _create_achievement_item(name: String, description: String, unlocked: bool) -> HBoxContainer:
    var container = HBoxContainer.new()

    var icon = Label.new()
    icon.text = "🏆" if unlocked else "🔒"
    icon.custom_minimum_size = Vector2(40, 40)
    container.add_child(icon)

    var text_container = VBoxContainer.new()

    var name_label = Label.new()
    name_label.text = name
    if unlocked:
        name_label.add_theme_color_override("font_color", Color(1, 0.85, 0.2))
    else:
        name_label.add_theme_color_override("font_color", Color(0.5, 0.5, 0.5))
    text_container.add_child(name_label)

    var desc_label = Label.new()
    desc_label.text = description
    desc_label.add_theme_color_override("font_color", Color(0.7, 0.7, 0.7))
    text_container.add_child(desc_label)

    container.add_child(text_container)

    return container


func _on_close_pressed() -> void:
    ui_closed.emit()
    queue_free()
