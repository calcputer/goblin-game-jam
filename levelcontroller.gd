extends Node

var brain = false
var brainJuice = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Player").connect("brainMode", self, "_on_player_brainMode")

func _on_player_brainMode(brainMode):
	brain = brainMode

func _process(delta):
	if brain:
		brainJuice = brainJuice -1
		(get_node("GUI/LifeBar") as ProgressBar).value = brainJuice
