extends Camera2D
@export var scene = 1
var tween
signal transition
var scene_1
var scene_2
var scene_3

func set_scene(new_scene):
	animate_camera(new_scene, scene)
	scene = new_scene
	
	
func animate_camera(new_scene, _old_scene):
	if new_scene == 3:
		emit_signal('transition', scene, new_scene)
		tween = create_tween()
		tween.tween_property(self, 'global_position', scene_3.global_position, 0.5)
		print('going up')
		tween = create_tween()
	elif new_scene == 2:
		emit_signal('transition', scene, new_scene)
		tween = create_tween()
		tween.tween_property(self, 'global_position', scene_2.global_position, 0.5)
		print('going up')
		tween = create_tween()
	elif new_scene == 1:
		emit_signal('transition', scene, new_scene)
		tween = create_tween()
		tween.tween_property(self, 'global_position', scene_1.global_position, 0.5)
		print('going down')
		tween = create_tween()
		
func reset_tween():
	tween = null
