extends Node2D


var arrow = preload("res://Arrow.tscn")

@export var timings: Array[float]
var index: int = 0;

var time: float = 0;
var timeInterval: float = 0

var stopped: bool = false

func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	time += delta
	if (time > timeInterval) and !stopped:
		timeInterval = timings[index]
		index += 1
		if (index >= timings.size()):
			stopped = true
		var instance = arrow.instantiate()
		add_child(instance)
		instance.global_rotation = global_rotation
		time = 0
	
	pass
