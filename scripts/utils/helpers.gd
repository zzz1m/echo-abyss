extends Node

func _ready() -> void:
    add_to_group("helpers")


static func clamp_vector2(value: Vector2, min_val: float, max_val: float) -> Vector2:
    return Vector2(
        clamp(value.x, min_val, max_val),
        clamp(value.y, min_val, max_val)
    )


static func random_point_in_circle(radius: float) -> Vector2:
    var angle = randf() * TAU
    var r = sqrt(randf()) * radius
    return Vector2(cos(angle), sin(angle)) * r


static func random_point_in_rect(rect: Rect2) -> Vector2:
    return Vector2(
        randf_range(rect.position.x, rect.end.x),
        randf_range(rect.position.y, rect.end.y)
    )


static func lerp_angle(from: float, to: float, weight: float) -> float:
    return lerp(from, to, weight)


static func angle_difference(from: float, to: float) -> float:
    var diff = fmod(to - from + PI, TAU) - PI
    return diff if diff >= -PI else -diff


static func format_time(seconds: float) -> String:
    var minutes = int(seconds) / 60
    var secs = int(seconds) % 60
    return "%02d:%02d" % [minutes, secs]


static func format_number(number: int) -> String:
    if number >= 1000000:
        return "%.1fM" % (number / 1000000.0)
    elif number >= 1000:
        return "%.1fK" % (number / 1000.0)
    return str(number)


static func weighted_random_choice(items: Array, weights: Array) -> Variant:
    var total_weight = 0.0
    for w in weights:
        total_weight += w

    var random_value = randf() * total_weight
    var cumulative = 0.0

    for i in range(items.size()):
        cumulative += weights[i]
        if random_value <= cumulative:
            return items[i]

    return items[items.size() - 1]


static func shuffle_array(array: Array) -> Array:
    var shuffled = array.duplicate()
    for i in range(shuffled.size()):
        var j = randi() % shuffled.size()
        var temp = shuffled[i]
        shuffled[i] = shuffled[j]
        shuffled[j] = temp
    return shuffled


static func ease_in_out(t: float) -> float:
    return t * t * (3.0 - 2.0 * t)


static func bounce(t: float) -> float:
    if t < 0.5:
        return 0.5 * ease_in_out(t * 2.0)
    else:
        return 0.5 * (1.0 - ease_in_out((t - 0.5) * 2.0)) + 0.5
