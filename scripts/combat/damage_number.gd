extends Node2D
class_name DamageNumber

signal animation_finished

@export var float_distance: float = 50.0
@export var float_duration: float = 0.8
@export var fade_duration: float = 0.3

var damage_value: int = 0
var is_critical: bool = false
var damage_type: int = 0

var float_direction: Vector2 = Vector2.UP
var elapsed_time: float = 0.0
var start_position: Vector2 = Vector2.ZERO


func _ready() -> void:
    modulate.a = 0.0


func initialize(damage: int, position: Vector2, critical: bool = false, type: int = 0) -> void:
    damage_value = damage
    global_position = position
    start_position = position
    is_critical = critical
    damage_type = type

    _setup_appearance()
    _play_animation()


func _setup_appearance() -> void:
    var label = $Label
    if label:
        label.text = str(damage_value)

        if is_critical:
            label.add_theme_color_override("font_color", Color.YELLOW)
            scale = Vector2(1.5, 1.5)
        else:
            match damage_type:
                1:
                    label.add_theme_color_override("font_color", Color.CYAN)
                2:
                    label.add_theme_color_override("font_color", Color.PURPLE)
                3:
                    label.add_theme_color_override("font_color", Color.WHITE)
                _:
                    label.add_theme_color_override("font_color", Color.RED)


func _play_animation() -> void:
    modulate.a = 1.0

    var tween = create_tween()
    tween.set_parallel(true)

    var end_pos = start_position + float_direction * float_distance
    tween.tween_property(self, "global_position", end_pos, float_duration)

    tween.tween_property(self, "modulate:a", 0.0, fade_duration).set_delay(float_duration - fade_duration)

    await tween.finished
    animation_finished.emit()
    queue_free()


static func spawn_damage_number(
    damage: int,
    position: Vector2,
    critical: bool = false,
    damage_type: int = 0,
    parent: Node = null
) -> void:
    var scene = preload("res://scenes/effects/damage_number.tscn")
    var number = scene.instantiate()

    number.initialize(damage, position, critical, damage_type)

    if parent:
        parent.add_child(number)
    else:
        Engine.get_main_loop().root.add_child(number)
