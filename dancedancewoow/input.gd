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
	
	if (PressedTime < maxTime):
		$Pressed.visible = true
		$Standard.visible = false
	
	if Input.is_action_just_pressed(inputs[InputKey]):
		PressedTime = 0
		var areas: Array[Area2D] = $".".get_overlapping_areas()
		if (areas.size() == 0):
			Global.setHitType(Global.hitType.Miss,0.8)
			Global.combo = 0
			Global.heat -= 0.08
		for area in areas:
			area.queue_free()
			var score = 0
			var distance = global_position.distance_to(area.global_position)
			score += (global_position.distance_to(area.global_position))
			score = floor(score) * 20
			score = clamp(score,0,600)
			Global.combo += 1
			Global.score += (600 - score + 400) * Global.heat
			if (distance < 18):
				Global.setHitType(Global.hitType.Perfect,0.4)
				Global.heat += 0.14
				$particle.emitting = true
			elif (distance < 26):
				Global.setHitType(Global.hitType.Great,0.8)
				Global.heat += 0.10
			elif (distance < 32):
				Global.setHitType(Global.hitType.Nice,1)
				Global.heat += 0.06

	pass


func _on_area_entered(area: Area2D) -> void:
	pass 
