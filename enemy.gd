extends Area2D

var velocity := Vector2.ZERO
var rv = 0
var life = 15.0

func init(vel: Vector2) -> void:
	rv = randf_range(-10, 10)
	velocity = vel
	global_scale *= randf_range(0.8, 1.3)

func _physics_process(delta: float) -> void:
	global_position += velocity * delta
	rotate(delta * rv)
	life -= delta
	if (life < 0):
		get_tree().current_scene.coin()
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.hit()
