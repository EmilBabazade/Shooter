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

var health: int = 60:
	get:
		return health
	set(value):
		health = value
		health_changed.emit()
