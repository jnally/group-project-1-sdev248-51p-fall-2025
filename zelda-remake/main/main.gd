extends Node2D
@onready var scene_1 = $Scene_1
@onready var scene_2 = $Scene_2
@onready var scene_3 = $Scene_3

func _ready():
	$Camera2D.scene_2 = scene_2
	$Camera2D.scene_1 = scene_1
	$Camera2D.scene_3 = scene_3

func _on_one_to_two_transition_body_entered(body: Node2D) -> void:
	if body.name == "Player" and $Camera2D.scene == 1:
		$Camera2D.set_scene(2)
	elif body.name == "Player" and $Camera2D.scene == 2:
		$Camera2D.set_scene(1)
		
		
func _on_two_to_three_transition_body_entered(body: Node2D) -> void:
	if body.name == "Player" and $Camera2D.scene == 2:
		$Camera2D.set_scene(3)
	elif body.name == "Player" and $Camera2D.scene == 3:
		$Camera2D.set_scene(2)
	


func _on_camera_2d_transition(old_scene, new_scene) -> void:
	$Player.toggle_moveable()
	var timer = Timer.new()
	timer.set_wait_time(0.5)
	timer.set_one_shot(true)
	self.add_child(timer)
	timer.start()
	await timer.timeout
	var diff = 195
	if new_scene > old_scene:
		diff *= -1
	$Player.position.y += diff
	$Player.toggle_moveable()
	
