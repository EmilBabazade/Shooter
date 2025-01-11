extends ItemContainerParent

func hit(damage: int):
	open_container(get_spawn_position, 5)

func get_spawn_position():
	var spawn_markers = $SpawnPoints.get_children()
	return spawn_markers[randi() % len(spawn_markers)].global_position
