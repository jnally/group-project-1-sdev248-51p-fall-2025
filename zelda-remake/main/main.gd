extends Node2D


func _on_one_to_two_transition_body_entered(body: Node2D) -> void:
	if body.name == "Player" and $Camera2D.scene == 1:
		$Camera2D.set_scene(2)
	elif body.name == "Player" and $Camera2D.scene == 2:
		$Camera2D.set_scene(1)
		
		

	


func _on_camera_2d_transition() -> void:
	$Player.toggle_moveable()
	var timer = Timer.new()
	timer.set_wait_time(0.5)
	timer.set_one_shot(true)
	self.add_child(timer)
	timer.start()
	await timer.timeout
	$Player.position.y -= 195
	$Player.toggle_moveable()
	
