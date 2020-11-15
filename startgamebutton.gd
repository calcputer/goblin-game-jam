extends Button

export var nextScene = "res://Floor1.tscn"
export var resetBrain = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if(resetBrain):
		Globals.brainJuice = 1000
	get_tree().change_scene(nextScene)
