extends Node
class_name TutorialSystem

signal tutorial_step_started(step_name: String)
signal tutorial_step_completed(step_name: String)
signal tutorial_finished
signal tutorial_skipped

enum TutorialStep {
    MOVEMENT,
    ATTACK,
    SKILL_Q,
    SKILL_W,
    SKILL_E,
    SKILL_R,
    ITEM_USAGE,
    INTERACTION,
    DODGE,
    GAME_COMPLETE,
}

var current_step: TutorialStep = TutorialStep.MOVEMENT
var completed_steps: Array = []
var is_tutorial_active: bool = false
var skip_tutorial_enabled: bool = false

var tutorial_conditions: Dictionary = {}


func _ready() -> void:
    add_to_group("tutorial_system")
    _initialize_tutorial()


func _initialize_tutorial() -> void:
    tutorial_conditions = {
        TutorialStep.MOVEMENT: {"type": "input", "action": "move", "count": 1},
        TutorialStep.ATTACK: {"type": "action", "action": "attack", "count": 3},
        TutorialStep.SKILL_Q: {"type": "action", "action": "skill_q", "count": 1},
        TutorialStep.SKILL_W: {"type": "action", "action": "skill_w", "count": 1},
        TutorialStep.SKILL_E: {"type": "action", "action": "skill_e", "count": 1},
        TutorialStep.SKILL_R: {"type": "action", "action": "skill_r", "count": 1},
        TutorialStep.ITEM_USAGE: {"type": "action", "action": "use_item", "count": 1},
        TutorialStep.INTERACTION: {"type": "action", "action": "interact", "count": 1},
        TutorialStep.DODGE: {"type": "action", "action": "dodge", "count": 1},
    }


func start_tutorial() -> void:
    is_tutorial_active = true
    current_step = TutorialStep.MOVEMENT
    _show_tutorial_step()


func skip_tutorial() -> void:
    is_tutorial_active = false
    tutorial_skipped.emit()
    _complete_all_steps()


func _show_tutorial_step() -> void:
    var step_name = _get_step_name(current_step)
    tutorial_step_started.emit(step_name)
    _display_tutorial_ui(step_name, _get_step_description(current_step))


func _display_tutorial_ui(title: String, description: String) -> void:
    var tutorial_ui = preload("res://scenes/ui/tutorial/tutorial_popup.tscn").instantiate()
    tutorial_ui.setup_tutorial(title, description)
    get_tree().current_scene.add_child(tutorial_ui)


func complete_step(step: TutorialStep) -> void:
    if step == current_step and step not in completed_steps:
        completed_steps.append(step)
        tutorial_step_completed.emit(_get_step_name(step))
        _advance_tutorial()


func _advance_tutorial() -> void:
    if current_step >= TutorialStep.GAME_COMPLETE:
        _end_tutorial()
        return

    current_step += 1

    while current_step in completed_steps and current_step < TutorialStep.GAME_COMPLETE:
        current_step += 1

    if current_step < TutorialStep.GAME_COMPLETE:
        _show_tutorial_step()
    else:
        _end_tutorial()


func _end_tutorial() -> void:
    is_tutorial_active = false
    tutorial_finished.emit()
    PersistentData.tutorial_completed = true


func _complete_all_steps() -> void:
    for step in TutorialStep.values():
        if step not in completed_steps:
            completed_steps.append(step)


func _get_step_name(step: TutorialStep) -> String:
    match step:
        TutorialStep.MOVEMENT:
            return "移动教学"
        TutorialStep.ATTACK:
            return "攻击教学"
        TutorialStep.SKILL_Q:
            return "技能Q"
        TutorialStep.SKILL_W:
            return "技能W"
        TutorialStep.SKILL_E:
            return "技能E"
        TutorialStep.SKILL_R:
            return "终极技能R"
        TutorialStep.ITEM_USAGE:
            return "物品使用"
        TutorialStep.INTERACTION:
            return "交互教学"
        TutorialStep.DODGE:
            return "闪避教学"
        TutorialStep.GAME_COMPLETE:
            return "教程完成"
        _:
            return "未知教学"


func _get_step_description(step: TutorialStep) -> String:
    match step:
        TutorialStep.MOVEMENT:
            return "使用 WASD 或方向键 移动角色"
        TutorialStep.ATTACK:
            return "按下 鼠标左键 或 J 键 进行普通攻击"
        TutorialStep.SKILL_Q:
            return "按下 Q 键 释放技能"
        TutorialStep.SKILL_W:
            return "按下 W 键 释放技能"
        TutorialStep.SKILL_E:
            return "按下 E 键 释放技能"
        TutorialStep.SKILL_R:
            return "按下 R 键 释放终极技能（消耗更多能量）"
        TutorialStep.ITEM_USAGE:
            return "按 1-9 数字键 使用背包中的物品"
        TutorialStep.INTERACTION:
            return "接近 NPC 或物体时按 E 键 进行交互"
        TutorialStep.DODGE:
            return "按 空格键 或 SHIFT 进行闪避/翻滚"
        TutorialStep.GAME_COMPLETE:
            return "恭喜你完成了基础教程！"
        _:
            return ""


func is_step_completed(step: TutorialStep) -> bool:
    return step in completed_steps


func get_tutorial_progress() -> float:
    return float(completed_steps.size()) / float(TutorialStep.GAME_COMPLETE)


func force_step(step: TutorialStep) -> void:
    if step not in completed_steps:
        complete_step(step)
