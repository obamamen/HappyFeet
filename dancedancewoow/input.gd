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
	
	
	PressedTime += delta
	
	if Input.is_action_just_pressed(inputs[InputKey]):
		PressedTime = 0
	
	
	if (PressedTime < maxTime):
		$Pressed.visible = true
		$Standard.visible = false
		var areas: Array[Area2D] = $".".get_overlapping_areas()
		for area in areas:
			area.queue_free()
			var score = 0
			var distance = global_position.distance_to(area.global_position)
			score += (global_position.distance_to(area.global_position))
			score = floor(score) * 20
			score = clamp(score,0,600)
			print(600 - score + 400)
			
			Global.score += (600 - score + 400)
			if (distance < 5):
				Global.setHitType(Global.hitType.Perfect,0.4)
			elif (distance < 10):
				Global.setHitType(Global.hitType.Great,0.8)
			elif (distance < 15):
				Global.setHitType(Global.hitType.Nice,1)

	pass


func _on_area_entered(area: Area2D) -> void:
#/if (PressedTime < maxTime):
	#	area.queue_free()
	#	Global.score += (maxTime - PressedTime) * 100
	pass 
