extends Node

var brain = false
var brainJuice = Globals.brainJuice

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Player").connect("brainMode", self, "_on_player_brainMode")
	(get_node("UI Effects/GUICanvas/GUI/LifeBar") as ProgressBar).value = brainJuice

func _on_player_brainMode(brainMode):
	brain = brainMode

func _process(delta):
	if brain:
		brainJuice = brainJuice -1
		Globals.brainJuice = brainJuice
		(get_node("UI Effects/GUICanvas/GUI/LifeBar") as ProgressBar).value = brainJuice
		if brainJuice <= 0:
			get_tree().change_scene("res://LoseScreen.tscn")
