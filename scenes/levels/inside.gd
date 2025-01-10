extends LevelParent

func _on_area_2d_body_entered(_body):
	call_deferred('change_level')

func change_level():
	TransitionLayer.change_scene('res://scenes/levels/outside.tscn')
