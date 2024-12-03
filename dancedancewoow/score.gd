extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var passedTime: float = 0

func formatInt(n: int) -> String:
	var re = ""
	var numstr = str(n)
	var count = 0
	
	for i in range(numstr.length() - 1, -1, -1):
		re = numstr[i] + re
		if (i % 3 == 0) && (i != 0):
			re = " " + re
			
	#if (numstr.length() % 3 != 0):
	#	for i in range(3 - numstr.length() % 3):
	#		re = re + "0"
	
	#print(numstr.length() % 3)
	
	return re

# Called every frame. 'delta' is the elapsed time since the prwevious frame.
func _process(delta: float) -> void:
	
	passedTime += delta
	
	if (passedTime > Global.textDelay):
		text = "Score    " + formatInt(Global.score);
		passedTime = 0
	pass
