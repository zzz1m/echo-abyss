extends BaseEnemy

@export var split_count: int = 2
@export var split_health_threshold: float = 0.3

var has_split: bool = false


func _ready() -> void:
    super._ready()
    enemy_type = EnemyType.ELITE
    enemy_name = "分裂怪"
    max_health = 150
    speed = 90.0
    damage = 20
    attack_range = 45.0
    detection_range = 180.0


func take_damage(amount: int, damage_type: int = 0) -> void:
    super.take_damage(amount, damage_type)

    if not has_split and float(current_health) / float(max_health) <= split_health_threshold:
        _split()


func _split() -> void:
    has_split = true

    if animation_player.has_animation("split"):
        animation_player.play("split")

    for i in range(split_count):
        _spawn_minion()


func _spawn_minion() -> void:
    var minion_scene = load("res://scenes/enemies/common/enemy_minion.tscn")
    var minion = minion_scene.instantiate()

    var offset = Vector2(randf_range(-30, 30), randf_range(-30, 30))
    minion.global_position = global_position + offset

    get_parent().add_child(minion)


func attack() -> void:
    if not can_attack():
        return

    if animation_player.has_animation("attack"):
        animation_player.play("attack")

    var attack_hitbox = $HitboxArea
    if attack_hitbox:
        attack_hitbox.monitoring = true
        await get_tree().create_timer(0.3).timeout
        attack_hitbox.monitoring = false

    last_attack_time = Time.get_ticks_msec() / 1000.0
