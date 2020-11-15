extends KinematicBody2D

var ENEMY_SPEED = 1.5
var wiggleTime;

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("../../../Player").connect("brainMode", self, "_on_player_brainMode")
	wiggleTime = rand_range(1.0,100.0);

func _on_player_brainMode(brainMode):
	if(brainMode):
		ENEMY_SPEED = 1
	else:
		ENEMY_SPEED = 1.5

func _process(_delta):
	var pathFollow = get_parent() as PathFollow2D
	pathFollow.offset += ENEMY_SPEED
	rotation = -pathFollow.rotation
	if(pathFollow.rotation_degrees <= 90 && pathFollow.rotation_degrees >= -90):
		scale.x = -1
	else:
		scale.x = 1
	# set a scale offset value based on delta and the wiggle time
	wiggleTime += _delta*ENEMY_SPEED*2.0;
	var wiggleOffsetX = cos(wiggleTime);
	var wiggleOffsetY = sin(wiggleTime*2.5); 
	var lilMan = get_node("EnemySprite"); 
	lilMan.scale.x = 1 + abs(wiggleOffsetX)*0.2;
	lilMan.scale.y = 1 + abs(wiggleOffsetY)*0.2;
	
