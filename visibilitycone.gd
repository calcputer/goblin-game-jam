extends Area2D

func _ready():
	get_node("../../../Player").connect("brainMode", self, "_on_player_brainMode")

func _on_player_brainMode(brainMode):
	visible = brainMode


func _on_Player_body_entered(body):
	if body == get_node("../../../Player"):
		get_tree().change_scene("res://LoseScreen.tscn")
