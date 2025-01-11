extends RigidBody2D

@export var speed: int = 750

var entities: Array[Node2D] = []

func explode():
	var ap = $AnimationPlayer as AnimationPlayer
	ap.play('explosion')
	collision_layer = 0
	collision_mask = 0
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	for e in entities:
		e.hit(20)


func _on_damage_range_body_entered(body):
	if body.is_in_group('entity'):
		entities.append(body)


func _on_damage_range_body_exited(body):
	if body.is_in_group('entity'):
		var index = entities.find(body)
		if index != -1:
			entities.remove_at(index)
