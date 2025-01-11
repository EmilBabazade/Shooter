extends LevelParent

func _on_gate_player_entered_gate(_body):
	call_deferred('change_scene')

func change_scene():
	TransitionLayer.change_scene('res://scenes/levels/inside.tscn')

func _on_house_player_entered():
	zoom_camera(Vector2(1, 1))

func _on_house_player_exited():
	zoom_camera(Vector2(.6, .6))

func zoom_camera(zoom: Vector2):
	var tween = create_tween()
	tween.tween_property($Player/Camera2D, 'zoom', zoom, 1)
