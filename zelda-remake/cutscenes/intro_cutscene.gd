extends Node2D

func _ready():
	pass


func _input(event):
	if event.is_action("attack"):
		get_tree().change_scene_to_file("res://main/main.tscn")
