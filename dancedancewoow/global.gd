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

var highScore: int = 0

func ready() -> void:
	textDelay = 0.08
	combo = 0
	heat = 1
	currentHitType = hitType.Normal
	currentHitTime = 0
	score= 0
	active = 0

func setHitType(type: hitType, duration: float) -> void: 
	currentHitType = type
	currentHitTime = duration


func _process(delta: float) -> void:
	currentHitTime -= delta
	#heat = clamp(heat, 0.6, 1.8)
	active = false
	highScore = max(score, highScore)
	if (currentHitTime > 0):
		active = true
