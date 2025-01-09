extends Area2D

@export var speed: int = 2000
var direction: Vector2

func _process(delta):
	position += delta * speed * direction


func _on_body_entered(body: Node2D):
	if 'hit' in body:
		body.hit()
	queue_free()


func _on_life_timeout():
	queue_free()
