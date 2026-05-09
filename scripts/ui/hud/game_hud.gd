extends Control
class_name GameHUD

@onready var health_bar: ProgressBar = $VBoxContainer/HealthContainer/HealthBar
@onready var health_label: Label = $VBoxContainer/HealthContainer/HealthLabel
@onready var energy_bar: ProgressBar = $VBoxContainer/EnergyContainer/EnergyBar
@onready var energy_label: Label = $VBoxContainer/EnergyContainer/EnergyLabel
@onready var skill_q: TextureRect = $VBoxContainer/SkillBar/SkillQ
@onready var skill_w: TextureRect = $VBoxContainer/SkillBar/SkillW
@onready var skill_e: TextureRect = $VBoxContainer/SkillBar/SkillE
@onready var skill_r: TextureRect = $VBoxContainer/SkillBar/SkillR
@onready var zone_label: Label = $VBoxContainer/ZoneLabel
@onready var room_label: Label = $VBoxContainer/RoomLabel

var player: Player


func _ready() -> void:
    _setup_ui()


func _setup_ui() -> void:
    health_bar.max_value = 100
    health_bar.value = 100
    energy_bar.max_value = 100
    energy_bar.value = 100


func set_player(new_player: Player) -> void:
    player = new_player
    _connect_player_signals()
    _update_health(player.current_health, player.max_health)
    _update_energy(player.current_energy, player.max_energy)


func _connect_player_signals() -> void:
    player.health_changed.connect(_on_health_changed)
    player.energy_changed.connect(_on_energy_changed)


func _on_health_changed(new_health: int) -> void:
    _update_health(new_health, player.max_health)


func _on_energy_changed(new_energy: float) -> void:
    _update_energy(new_energy, player.max_energy)


func _update_health(current: int, maximum: int) -> void:
    health_bar.max_value = maximum
    health_bar.value = current
    health_label.text = "%d / %d" % [current, maximum]


func _update_energy(current: float, maximum: float) -> void:
    energy_bar.max_value = maximum
    energy_bar.value = current
    energy_label.text = "%.0f / %.0f" % [current, maximum]


func update_zone(zone_name: String) -> void:
    zone_label.text = zone_name


func update_room(room_index: int) -> void:
    room_label.text = "房间 %d" % room_index


func update_skill_cooldown(skill_key: String, cooldown_percent: float) -> void:
    match skill_key:
        "Q":
            skill_q.modulate.a = 1.0 - cooldown_percent
        "W":
            skill_w.modulate.a = 1.0 - cooldown_percent
        "E":
            skill_e.modulate.a = 1.0 - cooldown_percent
        "R":
            skill_r.modulate.a = 1.0 - cooldown_percent
