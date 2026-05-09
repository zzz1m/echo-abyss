extends Control

signal command_entered(command: String)
signal console_closed

@onready var output_area: RichTextLabel = $VBoxContainer/OutputArea
@onready var input_line: LineEdit = $VBoxContainer/InputLine
@onready var toggle_button: Button = $ToggleButton

var command_history: Array = []
var history_index: int = -1
var is_visible: bool = true


func _ready() -> void:
    _setup_console()
    _connect_signals()
    _print_welcome()


func _setup_console() -> void:
    output_area.bbcode_enabled = true
    output_area.scroll_following = true


func _connect_signals() -> void:
    input_line.text_submitted.connect(_on_command_submitted)
    toggle_button.pressed.connect(toggle_console)
    input_line.focus_entered.connect(_on_input_focused)
    input_line.focus_exited.connect(_on_input_unfocused)


func _print_welcome() -> void:
    _print_line("[color=cyan]=== 回响深渊 调试控制台 ===[/color]")
    _print_line("[color=yellow]输入 'help' 查看可用命令[/color]")
    _print_line("")


func _on_command_submitted(command: String) -> void:
    command = command.strip_edges()
    if command.is_empty():
        return

    command_history.append(command)
    history_index = command_history.size()

    _print_line("[color=gray]>[/color] " + command)
    command_entered.emit(command)
    _execute_command(command)

    input_line.clear()


func _execute_command(command: String) -> void:
    var parts = command.split(" ", false)
    var cmd = parts[0].to_lower()

    match cmd:
        "help":
            _show_help()
        "clear":
            output_area.clear()
        "stats":
            _show_stats()
        "pos", "position":
            _show_player_position()
        "spawn":
            _spawn_enemy(parts[1] if parts.size() > 1 else "bat")
        "kill":
            _kill_all_enemies()
        "heal":
            _heal_player()
        "god":
            _toggle_god_mode()
        "tp":
            _teleport_player(parts)
        "give":
            _give_item(parts[1] if parts.size() > 1 else "")
        "money":
            _add_money(int(parts[1]) if parts.size() > 1 else 100)
        "zones":
            _show_zones()
        "fps":
            _show_fps()
        "time":
            _show_game_time()
        "end":
            _trigger_ending()
        _:
            _print_line("[color=red]未知命令: " + cmd + "[/color]")


func _show_help() -> void:
    _print_line("[color=yellow]=== 可用命令 ===[/color]")
    _print_line("help     - 显示此帮助")
    _print_line("clear    - 清除控制台")
    _print_line("stats    - 显示玩家状态")
    _print_line("pos      - 显示玩家位置")
    _print_line("spawn <type> - 生成敌人 (bat/crawler/specter)")
    _print_line("kill     - 杀死所有敌人")
    _print_line("heal     - 完全恢复生命")
    _print_line("god      - 切换无敌模式")
    _print_line("tp <x> <y> - 传送到坐标")
    _print_line("give <item> - 给予物品")
    _print_line("money <amt> - 添加金币")
    _print_line("zones    - 显示区域信息")
    _print_line("fps      - 显示帧率")
    _print_line("time     - 显示游戏时间")
    _print_line("end      - 触发结局")


func _show_stats() -> void:
    var player = get_tree().get_first_node_in_group("player")
    if not player:
        _print_line("[color=red]未找到玩家[/color]")
        return

    _print_line("[color=yellow]=== 玩家状态 ===[/color]")
    _print_line("生命: %d / %d" % [player.current_health, player.max_health])
    _print_line("能量: %.1f / %.1f" % [player.current_energy, player.max_energy])
    _print_line("速度: %.1f" % player.speed)


func _show_player_position() -> void:
    var player = get_tree().get_first_node_in_group("player")
    if not player:
        _print_line("[color=red]未找到玩家[/color]")
        return

    _print_line("位置: (%.1f, %.1f)" % [player.position.x, player.position.y])


func _spawn_enemy(enemy_type: String) -> void:
    var enemy_scene: PackedScene
    match enemy_type:
        "bat":
            enemy_scene = load("res://scenes/enemies/common/enemy_bat.tscn")
        "crawler":
            enemy_scene = load("res://scenes/enemies/common/enemy_crawler.tscn")
        "specter":
            enemy_scene = load("res://scenes/enemies/common/enemy_specter.tscn")
        _:
            enemy_scene = load("res://scenes/enemies/common/enemy_bat.tscn")

    var enemy = enemy_scene.instantiate()
    var player = get_tree().get_first_node_in_group("player")
    if player:
        enemy.position = player.position + Vector2(100, 0)
        get_parent().add_child(enemy)
        _print_line("[color=green]已生成: " + enemy_type + "[/color]")


func _kill_all_enemies() -> void:
    var enemies = get_tree().get_nodes_in_group("enemy")
    for enemy in enemies:
        if enemy.has_method("die"):
            enemy.die()
    _print_line("[color=green]已杀死 %d 个敌人[/color]" % enemies.size())


func _heal_player() -> void:
    var player = get_tree().get_first_node_in_group("player")
    if player and player.has_method("heal"):
        player.heal(player.max_health)
        _print_line("[color=green]已完全恢复生命[/color]")


func _toggle_god_mode() -> void:
    var player = get_tree().get_first_node_in_group("player")
    if not player:
        return

    player.is_invincible = !player.is_invincible
    var status = "开启" if player.is_invincible else "关闭"
    _print_line("[color=yellow]无敌模式: " + status + "[/color]")


func _teleport_player(parts: Array) -> void:
    var player = get_tree().get_first_node_in_group("player")
    if not player:
        return

    if parts.size() >= 3:
        var x = float(parts[1])
        var y = float(parts[2])
        player.position = Vector2(x, y)
        _print_line("[color=green]传送到: (%.1f, %.1f)[/color]" % [x, y])


func _give_item(item_name: String) -> void:
    _print_line("[color=green]已给予: " + item_name + "[/color]")


func _add_money(amount: int) -> void:
    if PersistentData:
        PersistentData.echo_coins += amount
    _print_line("[color=green]获得 %d 金币[/color]" % amount)


func _show_zones() -> void:
    var progression = get_node_or_null("/root/ProgressionTracker")
    if progression:
        _print_line("[color=yellow]当前区域: " + progression.current_zone + "[/color]")
        _print_line("已通关: %s" % str(progression.zones_cleared))


func _show_fps() -> void:
    var fps = Engine.get_frames_per_second()
    var color = "green" if fps >= 50 else "yellow" if fps >= 30 else "red"
    _print_line("[color=" + color + "]FPS: %d[/color]" % fps)


func _show_game_time() -> void:
    var time = Time.get_time_dict_from_system()
    _print_line("系统时间: %02d:%02d:%02d" % [time.hour, time.minute, time.second])


func _trigger_ending() -> void:
    var ending = get_node_or_null("/root/EndingSystem")
    if ending:
        ending.trigger_ending()


func _print_line(text: String) -> void:
    output_area.append_text(text + "\n")


func toggle_console() -> void:
    is_visible = !is_visible
    visible = is_visible


func _on_input_focused() -> void:
    get_tree().paused = true


func _on_input_unfocused() -> void:
    get_tree().paused = false


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("toggle_console"):
        toggle_console()

    if not visible:
        return

    if event.is_action_pressed("ui_up"):
        _navigate_history(-1)
    elif event.is_action_pressed("ui_down"):
        _navigate_history(1)


func _navigate_history(direction: int) -> void:
    if command_history.is_empty():
        return

    history_index += direction
    history_index = clamp(history_index, 0, command_history.size() - 1)

    if history_index < command_history.size():
        input_line.text = command_history[history_index]
        input_line.caret_position = input_line.text.length()
