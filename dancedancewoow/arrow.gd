extends Area2D

@export var speed: int = 360



func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	position += transform.x * speed * delta
	pass
