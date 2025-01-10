extends CanvasLayer

var black = Color(0, 0, 0, 1)
var transparent = Color(0, 0, 0, 0)

func change_scene(target_scene: StringName):
	var tween = create_tween()
	tween.tween_property($ColorRect, 'color', black, 1)
	tween.tween_property($ColorRect, 'color', transparent, 1)
	await tween.step_finished
	get_tree().change_scene_to_file(target_scene)
