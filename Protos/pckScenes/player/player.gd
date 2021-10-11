extends KinematicBody2D

onready var animation = $texture

var speed = 100

var velocity = Vector2.ZERO

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('right'):
		velocity.x += 1
		animation.flip_h = false
	if Input.is_action_pressed('left'):
		velocity.x -= 1
		animation.flip_h = true
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	if velocity == Vector2(0, 0):
		animation.animation = "idle"
	else:
		animation.animation = "run"
