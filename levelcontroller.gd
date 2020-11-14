extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Player").connect("brainMode", self, "_on_player_brainMode")

func _on_player_brainMode(brainMode):
	print(brainMode)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
