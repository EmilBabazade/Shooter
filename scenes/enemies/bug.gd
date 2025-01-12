extends CharacterBody2D

var is_player_detected = false
@onready var animator: AnimatedSprite2D = $AnimatedSprite2D
var speed = 200

func _process(delta):
	if is_player_detected:
		walk_to_player()

func walk_to_player():
	look_at(Globals.player_position)
	animator.play('walk')
	var direction = position.direction_to(Globals.player_position)
	velocity = speed * direction
	move_and_slide()

func _on_notice_area_2d_body_entered(_body):
	is_player_detected = true


func _on_notice_area_2d_body_exited(_body):
	is_player_detected = false
