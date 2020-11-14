extends KinematicBody2D

const ENEMY_SPEED = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	var pathFollow = get_parent() as PathFollow2D
	pathFollow.offset += ENEMY_SPEED
	
