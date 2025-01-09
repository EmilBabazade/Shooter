extends LevelParent

var outside_level: PackedScene = preload("res://scenes/levels/outside.tscn")

func _on_area_2d_body_entered(_body):
	call_deferred('change_level')

func change_level():
	get_tree().change_scene_to_packed(outside_level)
