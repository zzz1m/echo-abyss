extends Control
class_name EndingCutscene

signal cutscene_finished

@onready var background: ColorRect = $Background
@onready var ending_title: Label = $TextContainer/EndingTitle
@onready var ending_text: Label = $TextContainer/EndingText
@onready var continue_prompt: Label = $ContinuePrompt

var current_ending_key: String = ""
var text_lines: Array[String] = []
var current_line_index: int = 0
var can_advance: bool = true
var is_typing: bool = false


func _ready() -> void:
    continue_prompt.visible = false


func start_ending(ending_key: String) -> void:
    current_ending_key = ending_key

    match ending_key:
        "true_ending":
            _setup_ending("真结局：回响永存", Color(0, 0.8, 1, 1), get_true_ending_lines())
        "good_ending":
            _setup_ending("好结局：深渊平息", Color(0.2, 0.8, 0.3, 1), get_good_ending_lines())
        "normal_ending":
            _setup_ending("普通结局：轮回继续", Color(0.6, 0.6, 0.8, 1), get_normal_ending_lines())
        "bad_ending":
            _setup_ending("坏结局：深渊吞噬", Color(0.8, 0.2, 0.2, 1), get_bad_ending_lines())


func _setup_ending(title: String, color: Color, lines: Array[String]) -> void:
    ending_title.text = title
    ending_title.add_theme_color_override("font_color", color)
    text_lines = lines
    current_line_index = 0

    _display_next_line()


func _display_next_line() -> void:
    if current_line_index >= text_lines.size():
        _on_all_lines_displayed()
        return

    can_advance = false
    continue_prompt.visible = false

    var full_text = text_lines[current_line_index]
    ending_text.text = ""
    is_typing = true

    await _type_text(full_text)

    is_typing = false
    can_advance = true
    continue_prompt.visible = true
    current_line_index += 1


func _type_text(text: String) -> void:
    var chars_per_second = 30
    var char_delay = 1.0 / chars_per_second

    for i in range(text.length()):
        ending_text.text = text.substr(0, i + 1)
        await get_tree().create_timer(char_delay).timeout


func _on_all_lines_displayed() -> void:
    await get_tree().create_timer(2.0).timeout
    cutscene_finished.emit()
    queue_free()


func _unhandled_input(event: InputEvent) -> void:
    if not can_advance:
        return

    if event.is_pressed():
        _display_next_line()
