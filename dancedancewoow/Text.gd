extends Sprite2D

#@export var text: Texture2D
#@export var size: Vector2

var timer: float = 0
var startPos: Vector2 = Vector2.ZERO

var onScreenTimer: float = 0

@export var type: Global.hitType = Global.hitType.Normal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#texture = text
	#scale = size
	startPos = global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	onScreenTimer -= delta
	visible = false
	if (Global.active and type == Global.currentHitType):
		onScreenTimer = 0.4
		visible = true
	else:
		if (onScreenTimer > 0):
			visible = true
	pass
