extends KinematicBody2D

const ACCELERATION = 50
const GRAVITY = 9.8
const MAX_SPEED = 200
const JUMP_FORCE = -500
const ROTATION_SPEED = 3.5
var motion = Vector2()

func _physics_process(_delta):
	walk(_delta)
	

func walk(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.rotation += ROTATION_SPEED * delta
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.rotation += -ROTATION_SPEED * delta
	else:
		motion.x = 0
		friction = true
	
	if is_on_floor(): 
		if Input.is_action_pressed("ui_select"):
			motion.y = JUMP_FORCE
		if friction:
			motion.x = lerp(motion.x,0, 0.2)
	else:
		if friction:
			motion.x = lerp(motion.x,0, 0.05)
	motion = move_and_slide(motion, Vector2(0,-1))
	print(is_on_floor())
