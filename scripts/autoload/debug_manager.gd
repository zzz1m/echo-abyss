## DebugManager
## 调试管理器
## 提供开发调试功能、性能监控等

extends Node

signal debug_toggled(enabled: bool)

var is_debug_enabled: bool = false:
    set(value):
        is_debug_enabled = value
        _update_debug_visibility()
        debug_toggled.emit(value)

var show_fps: bool = true
var show_hitboxes: bool = false
var show_pathfinding: bool = false
var show_performance: bool = false

var debug_label: Label
var performance_label: Label
var debug_panel: Control


func _ready() -> void:
    process_mode = Node.PROCESS_MODE_ALWAYS
    _create_debug_ui()


func _process(_delta: float) -> void:
    if is_debug_enabled and show_performance:
        _update_performance_display()


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("debug_toggle"):
        is_debug_enabled = !is_debug_enabled

    if not is_debug_enabled:
        return

    if event.is_action_pressed("debug_reload"):
        _reload_current_scene()

    if event.is_action_pressed("debug_kill_all_enemies"):
        _kill_all_enemies()

    if event.is_action_pressed("debug_full_health"):
        _set_full_health()

    if event.is_action_pressed("debug_god_mode"):
        _toggle_god_mode()


func _create_debug_ui() -> void:
    var canvas := CanvasLayer.new()
    canvas.name = "DebugCanvas"
    canvas.layer = 100
    add_child(canvas)

    debug_panel = Control.new()
    debug_panel.name = "DebugPanel"
    debug_panel.anchors_preset = Control.PRESET_TOP_LEFT
    debug_panel.offset_left = 10.0
    debug_panel.offset_top = 10.0
    debug_panel.custom_minimum_size = Vector2(200, 100)
    canvas.add_child(debug_panel)

    var panel_style := StyleBoxFlat.new()
    panel_style.bg_color = Color(0, 0, 0, 0.7)
    panel_style.corner_radius_top_left = 8
    panel_style.corner_radius_top_right = 8
    panel_style.corner_radius_bottom_left = 8
    panel_style.corner_radius_bottom_right = 8
    panel_style.content_margin_left = 10.0
    panel_style.content_margin_top = 10.0
    panel_style.content_margin_right = 10.0
    panel_style.content_margin_bottom = 10.0
    debug_panel.add_theme_stylebox_override("panel", panel_style)

    debug_label = Label.new()
    debug_label.name = "DebugLabel"
    debug_label.text = "Debug Mode Active\n[F1] Toggle Debug\n[F2] Reload Scene\n[F3] Kill All Enemies\n[F4] Full Health\n[F5] God Mode"
    debug_label.autowrap_mode = TextServer.AUTOWRAP_WORD
    debug_panel.add_child(debug_label)

    performance_label = Label.new()
    performance_label.name = "PerformanceLabel"
    performance_label.anchors_preset = Control.PRESET_TOP_RIGHT
    performance_label.offset_right = -10.0
    performance_label.offset_top = 10.0
    performance_label.text = ""
    performance_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
    canvas.add_child(performance_label)

    _update_debug_visibility()


func _update_debug_visibility() -> void:
    if debug_panel:
        debug_panel.visible = is_debug_enabled
    if performance_label:
        performance_label.visible = is_debug_enabled and show_performance


func _update_performance_display() -> void:
    var fps := Engine.get_frames_per_second()
    var mem := Performance.get_monitor(Performance.MEMORY_STATIC) / 1024 / 1024
    var objects := Performance.get_monitor(Performance.OBJECT_COUNT)

    performance_label.text = "FPS: %d\nMemory: %.1f MB\nObjects: %d" % [fps, mem, objects]


func _reload_current_scene() -> void:
    get_tree().reload_current_scene()


func _kill_all_enemies() -> void:
    var enemies := get_tree().get_nodes_in_group("enemies")
    for enemy in enemies:
        if enemy.has_method("die"):
            enemy.die()
    print("Debug: Killed %d enemies" % enemies.size())


func _set_full_health() -> void:
    var players := get_tree().get_nodes_in_group("player")
    for player in players:
        if player.has_method("restore_health"):
            player.restore_health(player.max_health)
    print("Debug: Restored full health")


func _toggle_god_mode() -> void:
    var players := get_tree().get_nodes_in_group("player")
    for player in players:
        if player.has_method("toggle_god_mode"):
            player.toggle_god_mode()
    print("Debug: Toggled god mode")


func toggle_hitboxes() -> void:
    show_hitboxes = !show_hitboxes
    _update_hitbox_visibility()


func _update_hitbox_visibility() -> void:
    var hitboxes := get_tree().get_nodes_in_group("hitboxes")
    for hitbox in hitboxes:
        if hitbox is CollisionShape2D or hitbox is CollisionShape3D:
            hitbox.debug_color = Color.RED if show_hitboxes else Color(0, 0, 0, 0)


func log(message: String, category: String = "General") -> void:
    var timestamp := Time.get_datetime_string_from_system().split("T")[1]
    print("[%s][%s] %s" % [timestamp, category, message])


func log_warning(message: String, category: String = "Warning") -> void:
    push_warning("[%s] %s" % [category, message])


func log_error(message: String, category: String = "Error") -> void:
    push_error("[%s] %s" % [category, message])


func capture_screenshot() -> void:
    await get_tree().root.print_tree()
    get_viewport().get_texture().get_image().save_png("user://screenshot_%s.png" % Time.get_datetime_string_from_system().replace(":", "-"))


func get_debug_info() -> Dictionary:
    return {
        "fps": Engine.get_frames_per_second(),
        "memory": Performance.get_monitor(Performance.MEMORY_STATIC) / 1024 / 1024,
        "objects": Performance.get_monitor(Performance.OBJECT_COUNT),
        "nodes": Performance.get_monitor(Performance.OBJECT_NODE_COUNT),
        "process_time": Performance.get_monitor(Performance.TIME_PROCESS),
        "physics_time": Performance.get_monitor(Performance.TIME_PHYSICS_PROCESS),
    }


func print_scene_tree() -> void:
    print("=== Scene Tree ===")
    get_tree().root.print_tree()
    print("=================")
