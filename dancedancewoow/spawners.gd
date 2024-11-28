extends Node2D


var arrow = preload("res://Arrow.tscn")

@export var Standard: Texture2D

@export var timings: Array[float]
var index: int = 0;

var time: float = 0;
var timeInterval: float = 0

var stopped: bool = false

func _ready() -> void:
	timeInterval = timings[0]
	pass 

func spawn() -> void:
	var instance = arrow.instantiate()
	add_child(instance)
	instance.global_rotation = global_rotation
	instance.get_node("Sprite").texture = Standard


func process(delta: float) -> void:
	time += delta
	if (time > timeInterval) and !stopped:
		timeInterval = timings[index]
		index += 1
		if (index >= timings.size()):
			stopped = true
		spawn()
		time = 0
	
	pass
