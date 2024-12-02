extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var passedTime: float = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	passedTime += delta
	
	if (passedTime > Global.textDelay):
		Global.heat = clamp(Global.heat, 0.4, 2)
		text = "X  " + str(Global.heat)
		passedTime = 0
	pass
