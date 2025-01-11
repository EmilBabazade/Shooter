extends ItemContainerParent

func hit():
	open_container(get_spawn_position, 1)

func get_spawn_position():
	return $SpawnPoints/Marker.global_position
