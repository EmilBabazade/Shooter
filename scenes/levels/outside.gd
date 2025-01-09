extends LevelParent

#var inside_level: PackedScene = preload("res://scenes/levels/inside.tscn")

func _on_gate_player_entered_gate(_body):
	call_deferred('change_scene')

func change_scene():
	get_tree().change_scene_to_file("res://scenes/levels/inside.tscn")
