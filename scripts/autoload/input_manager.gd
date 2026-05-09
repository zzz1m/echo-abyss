## InputManager
## 输入管理器
## 处理输入映射、输入状态、控制器支持等

extends Node

signal input_action(action: String, pressed: bool)

var use_mouse: bool = true
var use_gamepad: bool = false

var mouse_position: Vector2 = Vector2.ZERO
var mouse_global_position: Vector2 = Vector2.ZERO

var gamepad_last_used: bool = false
var gamepad_deadzone: float = 0.2

var _action_states: Dictionary = {}


func _ready() -> void:
    process_mode = Node.PROCESS_MODE_ALWAYS


func _process(_delta: float) -> void:
    _check_input_devices()


func _input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        mouse_position = event.position
        mouse_global_position = event.global_position
        use_mouse = true
        use_gamepad = false
    elif event is InputEventJoypadMotion:
        if abs(event.axis_value) > gamepad_deadzone:
            use_gamepad = true
            use_mouse = false
            gamepad_last_used = true
    elif event is InputEventJoypadButton:
        if event.pressed:
            use_gamepad = true
            use_mouse = false
            gamepad_last_used = true

    if event.is_action("move_up") or event.is_action("move_down") or event.is_action("move_left") or event.is_action("move_right"):
        var action: String = event.action
        var pressed: bool = event.is_action_pressed(action)
        _action_states[action] = pressed
        input_action.emit(action, pressed)


func _check_input_devices() -> void:
    var any_joypad_input := false

    if Input.get_connected_joypads().size() > 0:
        var left_stick := Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
        var right_stick := Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

        if abs(left_stick) > gamepad_deadzone or abs(right_stick) > gamepad_deadzone:
            any_joypad_input = true

    use_gamepad = any_joypad_input


func get_move_direction() -> Vector2:
    var direction := Vector2.ZERO

    if use_mouse:
        direction = _get_mouse_direction()
    else:
        direction = _get_gamepad_direction()

    return direction.normalized()


func _get_mouse_direction() -> Vector2:
    var direction := Vector2.ZERO

    if Input.is_action_pressed("move_up"):
        direction.y -= 1
    if Input.is_action_pressed("move_down"):
        direction.y += 1
    if Input.is_action_pressed("move_left"):
        direction.x -= 1
    if Input.is_action_pressed("move_right"):
        direction.x += 1

    return direction


func _get_gamepad_direction() -> Vector2:
    var direction := Vector2.ZERO

    direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

    return direction


func get_mouse_world_position(camera: Camera2D = null) -> Vector2:
    if camera:
        return camera.get_global_mouse_position()
    return mouse_global_position


func is_action_just_pressed(action: String) -> bool:
    return Input.is_action_just_pressed(action)


func is_action_pressed(action: String) -> bool:
    return Input.is_action_pressed(action)


func is_action_just_released(action: String) -> bool:
    return Input.is_action_just_released(action)


func get_action_strength(action: String) -> float:
    return Input.get_action_strength(action)


func get_axis(negative_action: String, positive_action: String) -> float:
    return Input.get_axis(negative_action, positive_action)


func vibrate_controller(duration: float = 0.5, weak_magnitude: float = 0.5, strong_magnitude: float = 0.5) -> void:
    if use_gamepad:
        Input.start_joy_vibration(0, weak_magnitude, strong_magnitude, duration)


func stop_vibration() -> void:
    Input.stop_joy_vibration(0)


func get_connected_gamepads() -> Array:
    return Input.get_connected_joypads()


func get_current_gamepad_name() -> String:
    if Input.get_connected_joypads().size() > 0:
        return Input.get_joy_name(0)
    return ""


func set_mouse_mode(mode: Input.MouseMode) -> void:
    Input.set_mouse_mode(mode)


func get_mouse_mode() -> Input.MouseMode:
    return Input.get_mouse_mode()


func warp_mouse_to(position: Vector2) -> void:
    get_viewport().warp_mouse(position)
    mouse_position = position
    mouse_global_position = position


func is_using_mouse() -> bool:
    return use_mouse


func is_using_gamepad() -> bool:
    return use_gamepad
