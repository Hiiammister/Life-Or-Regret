extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -600.0
const ACCEL= 2.0
@onready var animatable_body_2d = $AnimatableBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var input:Vector2
var npcM1_in_range=false
func get_input():
	input.x=Input.get_action_strength("right")-Input.get_action_strength("left")
	input.y=Input.get_action_strength("down")-Input.get_action_strength("up")
	return input.normalized()

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"),"main")
		return
	var playerInput=get_input()
	velocity=lerp(velocity, playerInput*SPEED, delta*ACCEL)
	#animation walking
	if (velocity.x>1|| velocity.x<-1):
		animatable_body_2d.animation="walk"
	else:
		animatable_body_2d.animation="idle"
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	 #Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft=velocity.x<0
	animatable_body_2d.flip_h=isLeft
	var isRight=velocity.x<0
	animatable_body_2d.flip_h=isRight


func _on_detection2d_body_entered(body):
	if body.has_method("npcM1"):
		npcM1_in_range=true


func _on_detection2d_body_exited(body):
	if body.has_method("npcM1"):
		npcM1_in_range=false
