extends Node2D
class_name ParticleEmitter

@export var particle_scene: PackedScene
@export var emission_rate: float = 10.0
@export var particle_lifetime: float = 2.0
@export var initial_velocity: Vector2 = Vector2.ZERO
@export var velocity_variance: Vector2 = Vector2(50, 50)
@export var initial_scale: Vector2 = Vector2.ONE
@export var scale_variance: Vector2 = Vector2(0.5, 0.5)
@export var rotation_variance: float = 360.0
@export var fade_out: bool = true
@export var gravity: Vector2 = Vector2(0, 98)

var is_emitting: bool = false
var emission_timer: float = 0.0
var active_particles: Array = []


func _ready() -> void:
    if particle_scene == null:
        particle_scene = preload("res://scenes/effects/particles/basic_particle.tscn")


func _process(delta: float) -> void:
    if not is_emitting:
        return

    emission_timer += delta
    var emission_interval = 1.0 / emission_rate

    while emission_timer >= emission_interval:
        _emit_particle()
        emission_timer -= emission_interval

    _update_particles(delta)


func start_emitting() -> void:
    is_emitting = true


func stop_emitting() -> void:
    is_emitting = false


func emit_once() -> void:
    _emit_particle()


func _emit_particle() -> void:
    var particle = particle_scene.instantiate()
    add_child(particle)

    particle.global_position = global_position

    var vel = initial_velocity + Vector2(
        randf_range(-velocity_variance.x, velocity_variance.x),
        randf_range(-velocity_variance.y, velocity_variance.y)
    )
    particle.velocity = vel

    var scale = initial_scale * randf_range(
        1.0 - scale_variance.x,
        1.0 + scale_variance.x
    )
    particle.scale = scale

    particle.rotation_degrees = randf_range(-rotation_variance, rotation_variance)

    particle.lifetime = particle_lifetime
    particle.fade_enabled = fade_out
    particle.gravity = gravity

    particle.died.connect(_on_particle_died.bind(particle))
    active_particles.append(particle)


func _update_particles(delta: float) -> void:
    for particle in active_particles:
        if not is_instance_valid(particle):
            active_particles.erase(particle)
            continue


func _on_particle_died(particle: Node) -> void:
    if particle in active_particles:
        active_particles.erase(particle)


func clear_particles() -> void:
    for particle in active_particles:
        if is_instance_valid(particle):
            particle.queue_free()
    active_particles.clear()


func set_emission_rate(new_rate: float) -> void:
    emission_rate = max(0.1, new_rate)


func set_velocity(new_velocity: Vector2) -> void:
    initial_velocity = new_velocity


func set_lifetime(new_lifetime: float) -> void:
    particle_lifetime = max(0.1, new_lifetime)
