extends Node
class_name EndingSystem

signal ending_started(ending_type: int)
signal ending_completed
signal ending_skipped

enum EndingType {
    TRUE_ENDING,
    GOOD_ENDING,
    NORMAL_ENDING,
    BAD_ENDING,
}

enum EndingCondition {
    ALL_ZONES_CLEARED,
    BOSS_DEFEATED,
    ALLY_SURVIVED,
    CURSE_BROKEN,
    PLAYER_SACRIFICED,
    VOID_TRIUMPHED,
}

var current_ending: EndingType = EndingType.NORMAL_ENDING
var ending_conditions: Dictionary = {}
var is_playing: bool = false


func _ready() -> void:
    add_to_group("ending_system")
    _initialize_conditions()


func _initialize_conditions() -> void:
    ending_conditions = {
        EndingCondition.ALL_ZONES_CLEARED: false,
        EndingCondition.BOSS_DEFEATED: false,
        EndingCondition.ALLY_SURVIVED: false,
        EndingCondition.CURSE_BROKEN: false,
        EndingCondition.PLAYER_SACRIFICED: false,
        EndingCondition.VOID_TRIUMPHED: false,
    }


func evaluate_ending() -> EndingType:
    var conditions_met = ending_conditions.values().count(true)

    if ending_conditions[EndingCondition.CURSE_BROKEN] and \
       ending_conditions[EndingCondition.ALLY_SURVIVED] and \
       ending_conditions[EndingCondition.BOSS_DEFEATED]:
        current_ending = EndingType.TRUE_ENDING
    elif ending_conditions[EndingCondition.BOSS_DEFEATED] and \
         ending_conditions[EndingCondition.ALLY_SURVIVED]:
        current_ending = EndingType.GOOD_ENDING
    elif ending_conditions[EndingCondition.BOSS_DEFEATED]:
        current_ending = EndingType.NORMAL_ENDING
    else:
        current_ending = EndingType.BAD_ENDING

    return current_ending


func set_condition(condition: EndingCondition, value: bool) -> void:
    ending_conditions[condition] = value


func get_condition(condition: EndingCondition) -> bool:
    return ending_conditions.get(condition, false)


func trigger_ending() -> void:
    if is_playing:
        return

    is_playing = true
    var ending = evaluate_ending()
    ending_started.emit(ending)
    _play_ending_sequence(ending)


func _play_ending_sequence(ending: EndingType) -> void:
    match ending:
        EndingType.TRUE_ENDING:
            _play_true_ending()
        EndingType.GOOD_ENDING:
            _play_good_ending()
        EndingType.NORMAL_ENDING:
            _play_normal_ending()
        EndingType.BAD_ENDING:
            _play_bad_ending()


func _play_true_ending() -> void:
    print("=== 真结局：回响永存 ===")
    _show_ending_cutscene("true_ending")
    _display_ending_text(get_true_ending_text())
    ending_completed.emit()


func _play_good_ending() -> void:
    print("=== 好结局：深渊平息 ===")
    _show_ending_cutscene("good_ending")
    _display_ending_text(get_good_ending_text())
    ending_completed.emit()


func _play_normal_ending() -> void:
    print("=== 普通结局：轮回继续 ===")
    _show_ending_cutscene("normal_ending")
    _display_ending_text(get_normal_ending_text())
    ending_completed.emit()


func _play_bad_ending() -> void:
    print("=== 坏结局：深渊吞噬 ===")
    _show_ending_cutscene("bad_ending")
    _display_ending_text(get_bad_ending_text())
    ending_completed.emit()


func _show_ending_cutscene(ending_key: String) -> void:
    var scene = preload("res://scenes/ui/cutscenes/ending_cutscene.tscn").instantiate()
    get_tree().current_scene.add_child(scene)
    scene.start_ending(ending_key)


func _display_ending_text(text_lines: Array[String]) -> void:
    pass


func skip_ending() -> void:
    if is_playing:
        is_playing = false
        ending_skipped.emit()
        ending_completed.emit()


func get_true_ending_text() -> Array[String]:
    return [
        "深渊的回响终于平息...",
        "你聆听并理解了那些声音。",
        "所有的回响汇聚成光，驱散了永恒的黑暗。",
        "艾琳娜、莫里斯、还有无数被困的灵魂... 终于得到了安息。",
        "",
        "而你，作为聆听着，将永远记住这段旅程。",
        "",
        "真结局达成",
    ]


func get_good_ending_text() -> Array[String]:
    return [
        "深渊之心被击败。",
        "你打破了轮回的诅咒。",
        "艾琳娜和莫里斯得以团聚。",
        "",
        "虽然还有一些回响在远方回响...",
        "但至少，希望的火种被保存了下来。",
        "",
        "好结局达成",
    ]


func get_normal_ending_text() -> Array[String]:
    return [
        "深渊之心被击败。",
        "但代价是沉重的...",
        "",
        "艾琳娜消失在虚空中。",
        "莫里斯化为回响的一部分。",
        "",
        "轮回还在继续。",
        "",
        "普通结局达成",
    ]


func get_bad_ending_text() -> Array[String]:
    return [
        "深渊吞噬了一切...",
        "",
        "你的灵魂成为回响的一部分。",
        "永远在虚空中飘荡。",
        "",
        "聆听者... 成为了深渊的声音。",
        "",
        "坏结局达成",
    ]


func get_current_ending_name() -> String:
    match current_ending:
        EndingType.TRUE_ENDING:
            return "真结局"
        EndingType.GOOD_ENDING:
            return "好结局"
        EndingType.NORMAL_ENDING:
            return "普通结局"
        EndingType.BAD_ENDING:
            return "坏结局"
        _:
            return "未知结局"


func get_ending_stats() -> Dictionary:
    return {
        "ending_type": current_ending,
        "ending_name": get_current_ending_name(),
        "conditions_met": ending_conditions.values().count(true),
        "total_conditions": ending_conditions.size(),
    }
