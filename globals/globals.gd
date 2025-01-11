extends Node

signal laser_changed
signal grenade_changed
signal health_changed

var laser_amount: int = 20:
	get:
		return laser_amount
	set(value):
		laser_amount = value
		laser_changed.emit()

var grenade_amount: int = 5:
	get:
		return grenade_amount
	set(value):
		grenade_amount = value
		grenade_changed.emit()

var vulnerable = true
var health: int = 60:
	get:
		return health
	set(value):
		if value >= 0 and value <= 100 and value <= health and vulnerable:
			health = value
			set_vulnerable()
			health_changed.emit()
		if value >= health:
			health = value
			health_changed.emit()

func set_vulnerable():
	vulnerable = false
	await get_tree().create_timer(0.5).timeout
	vulnerable = true

var player_position: Vector2
