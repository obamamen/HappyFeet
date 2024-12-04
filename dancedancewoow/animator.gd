extends AnimationPlayer



func _ready() -> void:
	#play("Hardd1")
	pass

func _process(delta: float) -> void:
	pass


func _on_animation_finished(anim_name: StringName) -> void:
	$"..".end()
	pass 
