extends LevelParent

func _on_gate_player_entered_gate(_body):
	call_deferred('change_scene')

func change_scene():
	TransitionLayer.change_scene('res://scenes/levels/inside.tscn')
