extends Node2D
class_name BasicParticle

signal died

@export var velocity: Vector2 = Vector2.ZERO
@export var lifetime: float = 2.0
@export var fade_enabled: bool = true
@export var gravity: Vector2 = Vector2(0, 98)
@export var color_start: Color = Color.WHITE
@export var color_end: Color = Color(1, 1, 1, 0)
@export var size_start: float = 10.0
@export var size_end: float = 0.0

var current_lifetime: float = 0.0
var current_velocity: Vector2


func _ready() -> void:
    current_velocity = velocity
    modulate = color_start
    var size = size_start * randf_range(0.8, 1.2)
    _draw_circle(size)


func _process(delta: float) -> void:
    current_lifetime += delta
    current_velocity += gravity * delta
    position += current_velocity * delta

    var progress = current_lifetime / lifetime

    if fade_enabled:
        var new_color = color_start.lerp(color_end, progress)
        modulate = new_color

    var new_size = lerp(size_start, size_end, progress)
    _draw_circle(new_size)

    if current_lifetime >= lifetime:
        died.emit()
        queue_free()


func _draw_circle(radius: float) -> void:
    var tex = ImageTexture.create_from_image(
        _create_circle_image(int(radius * 2 + 4))
    )
    texture = tex


func _create_circle_image(size: int) -> Image:
    var img = Image.create(size, size, true, Image.FORMAT_RGBA8)
    img.fill(Color(0, 0, 0, 0))

    var center = size / 2
    var radius = center - 2

    for y in range(size):
        for x in range(size):
            var dist = sqrt(pow(x - center, 2) + pow(y - center, 2))
            if dist <= radius:
                var alpha = 255 if dist < radius - 1 else int(255 * (radius - dist))
                img.set_pixel(x, y, Color(color_start.r, color_start.g, color_start.b, alpha / 255.0))

    return img


func set_velocity(new_velocity: Vector2) -> void:
    velocity = new_velocity
    current_velocity = velocity


func set_colors(start: Color, end: Color) -> void:
    color_start = start
    color_end = end
    modulate = color_start
