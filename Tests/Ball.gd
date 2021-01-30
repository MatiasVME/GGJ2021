extends RigidBody2D

const ACC = 25
const GRAVITY = 12

var direction = 0

var move_x = 0
var move_y = 0

var is_dead := false

var can_move_left := true

func _physics_process(delta):
	if is_dead: return
	
	move_y = clamp(float(GRAVITY + move_y), -800, 200)
	
	direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
	if direction == 1:
		apply_impulse(Vector2.ZERO, Vector2.RIGHT * 200)
	elif direction == -1 and can_move_left:
		apply_impulse(Vector2.ZERO, Vector2.LEFT * 200)
	
	if Input.is_action_just_pressed("ui_accept"):
		apply_impulse(Vector2.ZERO, Vector2.UP * 10000)

