extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
const SPEED = 350
const JUMPFORCE = -1100
const GRAVITY = 35

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED

	else:
		pass # idle animation should be given here
		
	if not is_on_floor():
		pass # jump animation should be given here

	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMPFORCE

	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2) 
