extends CharacterBody2D


const SPEED = 10000.0
@export var moveable = true


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	get_input(delta)
	move_and_slide()

func get_input(delta):
	if !moveable:
		return
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var up = Input.is_action_pressed("up")
	var down = Input.is_action_pressed("down")
	
	if right:
		velocity.x = SPEED * delta
		$Sprite2D.flip_h = false
	elif left:
		velocity.x = -SPEED * delta
		$Sprite2D.flip_h = true
	else:
		velocity.x = 0  # Stop moving in the left direction
	
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
