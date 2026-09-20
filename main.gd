extends Node2D

var score = 0
var tscore = 0
var t = 0.0

func coin():
	score += (t/10.0) * (10.0 + randi_range(0, 5))

func _physics_process(delta: float) -> void:
	tscore = lerpf(tscore, score, 0.2)
	t += delta
	$ScoreLabel.text = str(int(tscore))
