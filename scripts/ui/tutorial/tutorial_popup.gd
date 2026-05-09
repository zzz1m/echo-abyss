extends Control
class_name TutorialPopup

signal tutorial_step_action
signal skip_tutorial

@onready var title_label: Label = $Content/TitleLabel
@onready var description_label: Label = $Content/DescriptionLabel
@onready var skip_button: Button = $Content/ButtonContainer/SkipButton
@onready var next_button: Button = $Content/ButtonContainer/NextButton

var tutorial_title: String = ""
var tutorial_description: String = ""
var can_dismiss: bool = false


func _ready() -> void:
    skip_button.pressed.connect(_on_skip_pressed)
    next_button.pressed.connect(_on_next_pressed)
    modulate.a = 0

    var tween = create_tween()
    tween.tween_property(self, "modulate:a", 1.0, 0.5)

    await get_tree().create_timer(1.0).timeout
    can_dismiss = true


func setup_tutorial(title: String, description: String) -> void:
    tutorial_title = title
    tutorial_description = description
    _update_ui()


func _update_ui() -> void:
    title_label.text = tutorial_title
    description_label.text = tutorial_description


func _on_skip_pressed() -> void:
    if can_dismiss:
        skip_tutorial.emit()
        _dismiss_popup()


func _on_next_pressed() -> void:
    if can_dismiss:
        tutorial_step_action.emit()
        _dismiss_popup()


func _dismiss_popup() -> void:
    can_dismiss = false
    var tween = create_tween()
    tween.tween_property(self, "modulate:a", 0.0, 0.3)
    await tween.finished
    queue_free()
