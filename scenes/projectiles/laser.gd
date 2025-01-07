extends Area2D

@export var speed: int = 2000
var direction: Vector2

func _process(delta):
	position += delta * speed * direction
