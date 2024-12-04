extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	end()
	pass

var isReset = false
var isResetTime: float = 0
var isTryingToEnd = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("heat", Global.heat)
	print("combo", Global.formatInt(10000))
	isResetTime += delta
	$Node2D2/AnimatedSprite2D.speed_scale = Global.heat
	$Node2D2/AnimatedSprite2D2.speed_scale = (Global.heat/2)
	if (Input.is_action_just_pressed("UP")) and (isReset) and (isResetTime > 0.25):
		start()
	var notes = get_tree().get_nodes_in_group("Note")
	if (notes.size() == 0) and (isTryingToEnd):
		$ResetCam.enabled = true
		$MainCamera.enabled = false
		isReset = true
		isResetTime = 0
		isTryingToEnd = false
	pass
	
func start() -> void:
	$animator.play("Hardd1")
	isReset = false
	$ResetCam.enabled = false
	$MainCamera.enabled = true
	Global.ready()
	isTryingToEnd = false
	
func end() -> void:
	isTryingToEnd = true
