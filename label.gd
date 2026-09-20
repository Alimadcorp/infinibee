extends Label

func _ready() -> void:
	hideee()

func hideee():
	await get_tree().create_timer(2.5).timeout
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 3.0)
	await tween.finished
