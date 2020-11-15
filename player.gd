extends KinematicBody2D

signal brainMode(brainOn) 

const PLAYER_SPEED = 150

var brainEquipped = false
var playerSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	playerSprite = get_node("PlayerSprite")


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
	if(motion.x > 0):
		playerSprite.scale.x = 1
	elif(motion.x < 0):
		playerSprite.scale.x = -1
	move_and_slide(motion)

func toggle_brain():
	brainEquipped = !brainEquipped
	emit_signal("brainMode", brainEquipped)
	get_node("PlayerSprite/BrainIn").visible = brainEquipped
	get_node("PlayerSprite/BrainOut").visible = !brainEquipped
	#show/hide enemy paths accordingly
	
