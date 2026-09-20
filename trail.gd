extends Line2D

@export var max_length: int = 20

func _process(_delta: float) -> void:
	var pp = get_parent().global_position
	add_point(pp)
	while points.size() > max_length:
		remove_point(0)
