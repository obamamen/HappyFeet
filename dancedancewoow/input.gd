extends Node2D

@export var Standard: Texture2D
@export var Pressed: Texture2D

@export var InputKey: int

var inputs = ["UP","RIGHT","LEFT","DOWN"]
var PressedTime: float = 0

var maxTime: float = 0.069



func _ready() -> void:
	$Standard.texture = Standard
	$Pressed.texture = Pressed
	$Pressed.visible = false
	pass 


func _process(delta: float) -> void:
	$Pressed.visible = false
	$Standard.visible = true
	print(Global.score)
	
	PressedTime += delta
	
	if Input.is_action_just_pressed(inputs[InputKey]):
		PressedTime = 0
	
	
	if (PressedTime < maxTime):
		$Pressed.visible = true
		$Standard.visible = false
		var areas: Array[Area2D] = $".".get_overlapping_areas()
		for area in areas:
			area.queue_free()
			Global.score += (maxTime - PressedTime) * 200
			Global.score += 50 - global_position.distance_to(area.global_position)
	pass


func _on_area_entered(area: Area2D) -> void:
#/if (PressedTime < maxTime):
	#	area.queue_free()
	#	Global.score += (maxTime - PressedTime) * 100
	pass 
