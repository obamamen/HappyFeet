extends Node

enum hitType {
	Normal,
	Nice,
	Great,
	Perfect,
	Miss,
	NONE
} 
var textDelay: float = 0.08
var combo: int = 0
var heat: float = 1
var currentHitType: hitType = hitType.Normal
var currentHitTime: float = 0
var score: int = 0
var active: bool = 0

func setHitType(type: hitType, duration: float) -> void: 
	currentHitType = type
	currentHitTime = duration


func _process(delta: float) -> void:
	currentHitTime -= delta
	#heat = clamp(heat, 0.6, 1.8)
	active = false
	if (currentHitTime > 0):
		active = true
