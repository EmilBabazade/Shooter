extends CharacterBody2D

var speed: float = 200

func _process(_delta):
	velocity = speed * Vector2(1, 0)
	move_and_slide()
