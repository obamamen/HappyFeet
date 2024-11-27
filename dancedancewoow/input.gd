extends Node2D

@export var Standard: Texture2D
@export var Pressed: Texture2D


func _ready() -> void:
	$Standard.texture = Standard
	pass 


func _process(delta: float) -> void:
	pass
