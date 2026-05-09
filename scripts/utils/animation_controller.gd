extends Node

signal animation_triggered(animation_name: String)
signal animation_finished(animation_name: String)

@export var animation_library: Dictionary = {}
@export var default_animation: String = "idle"

var current_animation: String = ""
var is_playing: bool = false


func _ready() -> void:
    add_to_group("animation_controller")


func play(animation_name: String, from_end: bool = false) -> void:
    if not animation_library.has(animation_name):
        return

    if current_animation == animation_name and is_playing:
        return

    current_animation = animation_name
    is_playing = true
    animation_triggered.emit(animation_name)

    var anim_data = animation_library[animation_name]
    _execute_animation(anim_data, from_end)


func stop() -> void:
    is_playing = false
    current_animation = ""


func _execute_animation(anim_data: Dictionary, from_end: bool) -> void:
    var duration = anim_data.get("duration", 1.0)
    var frames = anim_data.get("frames", [])

    if frames.size() == 0:
        await get_tree().create_timer(duration).timeout
        _on_animation_complete()
        return

    var frame_duration = duration / frames.size()
    var start_index = frames.size() - 1 if from_end else 0
    var end_index = -1 if from_end else frames.size()
    var step = -1 if from_end else 1

    for i in range(start_index, end_index, step):
        if not is_playing:
            return

        _apply_frame(frames[i])
        await get_tree().create_timer(frame_duration).timeout

    _on_animation_complete()


func _apply_frame(frame_data: Dictionary) -> void:
    pass


func _on_animation_complete() -> void:
    is_playing = false
    animation_finished.emit(current_animation)


func has_animation(animation_name: String) -> bool:
    return animation_library.has(animation_name)


func get_current_animation() -> String:
    return current_animation


func is_animation_playing() -> bool:
    return is_playing


func set_animation_library(lib: Dictionary) -> void:
    animation_library = lib


class AnimationData:
    extends RefCounted

    var name: String
    var duration: float
    var frames: Array[Dictionary]
    var loop: bool = false
    var blend_time: float = 0.0

    func _init(p_name: String, p_duration: float, p_loop: bool = false):
        name = p_name
        duration = p_duration
        loop = p_loop
