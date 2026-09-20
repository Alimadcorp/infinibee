extends CharacterBody2D

@export var vel: float = 600.0
@export var angular_vel: float = 8.0
var lost = false

var phase: float = 0
var pad = 10

func _physics_process(delta: float) -> void:
	var held: bool = Input.is_key_pressed(KEY_SPACE) or Input.is_action_pressed("ui_accept")
	phase += angular_vel * delta * (1 if held else -1)
	velocity = Vector2(cos(phase) * vel, sin(phase) * vel)

	if velocity != Vector2.ZERO:
		rotation = velocity.angle()
	if !lost:
		move_and_slide()
		var screen_size := get_viewport_rect().size
		global_position.x = wrapf(global_position.x, -pad, screen_size.x + pad)
		global_position.y = wrapf(global_position.y, -pad, screen_size.y + pad)

func hit():
	if lost: return
	lost = true
	var tween = create_tween()
	tween.set_parallel(true)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(40, 40), 1.5).from(Vector2(1, 1))
	tween.tween_property(self, "modulate:a", 0.0, 1.5).from(1.0)
	tween.chain().tween_callback(res)

func res():
	get_tree().change_scene_to_file("res://main.tscn")
