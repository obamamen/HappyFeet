extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func formatInt(n: int) -> String:
	var re = ""
	var numstr = str(n)
	var count = 0
	
	for i in range(numstr.length() - 1, -1, -1):
		re = numstr[i] + re
		if (i % 3 == 0) && (i != 0):
			re = " " + re

	
	return re


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "hScore  " + formatInt(Global.highScore);
	pass
