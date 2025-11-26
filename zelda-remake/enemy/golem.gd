extends CharacterBody2D

func hurt():
	queue_free()
	
func _physics_process(_delta: float) -> void:
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "Player":
			collision.get_collider().hurt()
