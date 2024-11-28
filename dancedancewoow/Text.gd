extends Sprite2D

@export var text: Texture2D
@export var size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = text
	scale = size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
