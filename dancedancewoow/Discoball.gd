extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var dir: int = 1
var frameTime: float = 0.05
var time: float = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	if (time > frameTime):
		time = 0
		frame += dir
		if (dir == 1) and (frame == 24):
			dir = -1
		if (dir == -1) and (frame == 0):
			dir = 1
	pass
