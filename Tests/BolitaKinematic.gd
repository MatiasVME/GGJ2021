extends KinematicBody2D

const ACCELERATION = 50
const GRAVITY = 20.8
const MAX_SPEED = 200
const JUMP_FORCE = -500
const ROTATION_SPEED = 3.5

var motion = Vector2()
var direction := 0

var can_move_left := true
var second_jump = true


func _physics_process(_delta):
	walk(_delta)
	

func walk(delta):
	motion.y += GRAVITY
	var friction = false

#	if Input.is_action_pressed("ui_right"):
#		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
#		$Sprite.rotation += ROTATION_SPEED * delta
#	elif Input.is_action_pressed("ui_left"):
#		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
#		$Sprite.rotation += -ROTATION_SPEED * delta
#	else:
#		motion.x = 0
#		friction = true

	direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
	if direction == 1:
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif direction == -1:
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		motion.x = 0
		friction = true
	
	if not is_on_floor():
		if second_jump:
			if Input.is_action_pressed("ui_select"):
				motion.y = JUMP_FORCE
				print(second_jump)
				second_jump = false
				print(second_jump)

	
	if is_on_floor(): 
		if Input.is_action_pressed("ui_select"):
			motion.y = JUMP_FORCE
		if friction:
			motion.x = lerp(motion.x,0, 0.2)
		if not second_jump:
			second_jump = true

	else:
		if friction:
			motion.x = lerp(motion.x,0, 0.05)
			
	motion = move_and_slide(motion, Vector2(0,-1))
