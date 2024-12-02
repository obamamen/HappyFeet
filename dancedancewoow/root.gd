extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("heat", Global.heat)
	print("combo", Global.combo)
	$Node2D2/AnimatedSprite2D.speed_scale = Global.heat
	$Node2D2/AnimatedSprite2D2.speed_scale = (Global.heat/2)
	pass
