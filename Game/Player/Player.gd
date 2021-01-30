extends KinematicBody2D

class_name Player

const ACCELERATION = 50
const GRAVITY = 20.8
const MAX_SPEED = 200
const JUMP_FORCE = -500
const ROTATION_SPEED = 3.5

var motion = Vector2()
var direction := 0
var can_jump = true
var hooked = false

func _physics_process(delta):
	if not hooked:
		walk(delta)
	else:
		seized()

func walk(delta):
	motion.y += GRAVITY
	var friction = false
	
	direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
	if direction == 1:
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif direction == -1:
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		motion.x = 0
		friction = true
	
	if is_on_floor(): 
		if Input.is_action_just_pressed("ui_select"):
			motion.y = JUMP_FORCE
		if friction:
			motion.x = lerp(motion.x,0, 0.2)
		if not can_jump:
			can_jump = true
	else:
		if can_jump:
			if Input.is_action_just_pressed("ui_select"):
					motion.y = JUMP_FORCE
					can_jump = false
		if friction:
			motion.x = lerp(motion.x,0, 0.05)
			
	motion = move_and_slide(motion, Vector2(0,-1))

func seized():
	if not can_jump:
		can_jump = true
	
	if Input.is_action_just_pressed("ui_select"):
		motion.y = JUMP_FORCE
		hooked = false
