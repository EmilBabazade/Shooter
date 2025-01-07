extends RigidBody2D

@export var speed: int = 750

func explode():
	var ap = $AnimationPlayer as AnimationPlayer
	ap.play('explosion')
	collision_layer = 0
	collision_mask = 0
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
