extends Sprite


var mouseposition

func _process(delta):
	mouseposition = get_global_mouse_position()
	position = mouseposition
