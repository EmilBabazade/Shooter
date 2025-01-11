extends ItemContainerParent

func hit():
	open_container(get_spawn_position, 5)

func get_spawn_position():
	var spawn_markers = $SpawnPoints.get_children()
	var pos = spawn_markers[randi() % len(spawn_markers)].global_position
	return spawn_markers[randi() % len(spawn_markers)].global_position
