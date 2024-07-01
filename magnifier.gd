extends Sprite2D

var zoom_in_factor := 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("zoom_in"):
		zoom_in_factor += 0.1
	elif Input.is_action_just_pressed("zoom_out"):
		zoom_in_factor -= 0.1
	
	zoom_in_factor = clamp(zoom_in_factor, 1, 3)
	material.set_shader_parameter("scale_factor", zoom_in_factor)
	
	position = get_global_mouse_position()
