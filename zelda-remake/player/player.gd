extends CharacterBody2D


const SPEED = 10000.0
@export var moveable = true


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	get_input(delta)
	move_and_slide()
	#for i in get_slide_collision_count():
		#var collision = get_slide_collision(i)
		#if collision.get_collider().is_in_group("golem"):
			#print('pow!')
			#collision.get_collider().hurt()
func hurt():
	print('youch!')
func get_input(delta):
	if !moveable:
		return
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var up = Input.is_action_pressed("up")
	var down = Input.is_action_pressed("down")
	@warning_ignore("shadowed_variable")
	var attack = Input.is_action_pressed("attack")
	
	if right:
		velocity.x = SPEED * delta
	elif left:
		velocity.x = -SPEED * delta
	else:
		velocity.x = 0  # Stop moving in the left direction
	
	if attack:
		attack()
	
	if up:
		velocity.y = -SPEED * delta
	elif down:
		velocity.y = SPEED * delta
	else:
		velocity.y = 0  # Stop moving in the down direction
		
func toggle_moveable():
	moveable = !moveable
	$Sprite2D.visible = true
	if moveable == false:
		$Sprite2D.visible = false
		velocity = Vector2.ZERO
		
func attack():
	$Sprite2D/KnucklesHit/Sprite2D.visible = true
	$Sprite2D/KnucklesHit/CollisionShape2D.disabled = false
	$AnimationPlayer.play("attack")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == 'attack':
		$Sprite2D/KnucklesHit/Sprite2D.visible = false
		$Sprite2D/KnucklesHit/CollisionShape2D.disabled = true


func _on_knuckles_hit_area_entered(area: Area2D) -> void:
	print(area, 'blarg')
	if area.is_in_group("golem"):
		area.hurt()
