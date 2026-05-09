extends Control
class_name AchievementPopup

@onready var name_label: Label = $Content/TextContainer/NameLabel
@onready var description_label: Label = $Content/TextContainer/DescriptionLabel

var achievement_name: String = ""
var achievement_description: String = ""


func _ready() -> void:
    modulate.a = 0
    _animate_in()


func setup_achievement(name: String, description: String) -> void:
    achievement_name = name
    achievement_description = description
    _update_ui()


func _update_ui() -> void:
    name_label.text = achievement_name
    description_label.text = achievement_description


func _animate_in() -> void:
    var tween = create_tween()
    tween.set_parallel(true)

    tween.tween_property(self, "modulate:a", 1.0, 0.3)

    await get_tree().create_timer(3.0).timeout

    _animate_out()


func _animate_out() -> void:
    var tween = create_tween()
    tween.set_parallel(true)

    tween.tween_property(self, "modulate:a", 0.0, 0.3)

    await tween.finished
    queue_free()
