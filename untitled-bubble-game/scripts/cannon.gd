extends Node2D
var mouse_position

func _process(delta: float) -> void:
	mouse_position = get_local_mouse_position()
	rotation += mouse_position.angle()*0.1
	
	pass
