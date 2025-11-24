extends Camera2D
@export var scene = 1
var tween
signal transition

func set_scene(new_scene):
	scene = new_scene
	animate_camera(scene)
	
func animate_camera(new_scene):
	if new_scene == 2:
		emit_signal('transition')
		tween = create_tween()
		tween.tween_property(self, 'global_position', $Scene_2.global_position, 0.5)
		print('going up')
		tween = create_tween()
	elif new_scene == 1:
		emit_signal('transition')
		tween = create_tween()
		tween.tween_property(self, 'global_position', $Scene_1.global_position, 0.5)
		print('going down')
		tween = create_tween()
		
func reset_tween():
	tween = null
