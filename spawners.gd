extends Node2D

var children = 0

var total_time: float = 0.0
const RAMP_TIME: float = 180.0
const START_DELAY: float = 2.5
const MIN_DELAY: float = 0.3
var current_delay: float = START_DELAY

const START_SPEED: float = 150.0
const MAX_SPEED: float = 400.0
var speed_deviation: float = 0.25
var deviation = 0.9
var left = 0.0
const enemy_scene = preload("res://enemy.tscn")

func _ready() -> void:
	children = get_child_count()
	left = current_delay * randf_range(deviation, 1.0 / deviation)
	
	var cam = get_viewport().get_camera_2d()
	if cam:
		global_position = cam.get_screen_center_position()
	else:
		global_position = get_viewport_rect().size / 2.0

func _physics_process(delta: float) -> void:
	total_time += delta
	
	var progress: float = clamp(total_time / RAMP_TIME, 0.0, 1.0)
	
	current_delay = lerp(START_DELAY, MIN_DELAY, progress)
	
	left -= delta
	rotate(2 * delta)
	
	if left <= 0:
		spawn(progress)
		left = current_delay * randf_range(deviation, 1.0 / deviation)

func spawn(progress: float) -> void:
	if children == 0:
		return
	
	var t = randi_range(0, children - 1)
	var spawn_node = get_child(t)
	var spawn_pos = spawn_node.global_position
	
	var base_direction: Vector2 = (global_position - spawn_pos).normalized()
	if base_direction == Vector2.ZERO:
		base_direction = Vector2.RIGHT
	
	var angle_offset: float = randf_range(-PI / 4.0, PI / 4.0)
	var final_direction: Vector2 = base_direction.rotated(angle_offset)
	
	var current_base_speed: float = lerp(START_SPEED, MAX_SPEED, progress)
	
	var speed_multiplier: float = randf_range(1.0 - speed_deviation, 1.0 + speed_deviation)
	var final_speed: float = current_base_speed * speed_multiplier
	var velocity: Vector2 = final_direction * final_speed
	instantiate(spawn_pos, velocity)

func instantiate(pos: Vector2, vel: Vector2) -> void:
	var ins = enemy_scene.instantiate()
	ins.global_position = pos
	ins.init(vel)
	get_parent().get_child(0).add_child(ins)
