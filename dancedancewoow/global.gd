extends Node

enum hitType {
	Normal,
	Nice,
	Great,
	Perfect,
	Miss,
	NONE
} 



var currentHitType: hitType = hitType.Normal
var currentHitTime: float = 0
var score: int = 0
var active: bool = 0

func setHitType(type: hitType, duration: float) -> void: 
	currentHitType = type
	currentHitTime = duration


func _process(delta: float) -> void:
	currentHitTime -= delta
	
	active = false
	if (currentHitTime > 0):
		active = true
