extends KinematicBody2D

const PLAYER_SPEED = 150

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var brainEquipped = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("toggle_brain"):
		toggle_brain()
	#if brain is on drop meter

func _physics_process(_delta):
	var motion = Vector2()
	motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	motion = motion.normalized() * PLAYER_SPEED
	move_and_slide(motion)

func toggle_brain():
	brainEquipped = !brainEquipped
	print("Brain on? ", brainEquipped)
	#show/hide enemy paths accordingly
	
