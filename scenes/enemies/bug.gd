extends CharacterBody2D

var is_player_detected = false
var is_player_in_attack_range = false
var attack_enabled = true
var invulnerable = false
@onready var animator: AnimatedSprite2D = $AnimatedSprite2D
var speed = 200
var health = 50

func _process(_delta):
	if is_player_in_attack_range and attack_enabled:
		attack()
	elif is_player_detected:
		walk_to_player()

func walk_to_player():
	look_at(Globals.player_position)
	animator.play('walk')
	var direction = position.direction_to(Globals.player_position)
	velocity = speed * direction
	move_and_slide()

func attack():
	animator.play('attack')
	await animator.animation_finished
	Globals.health -= 10
	attack_enabled = false
	$AttackCooldown.start()

func _on_notice_area_2d_body_entered(_body):
	is_player_detected = true


func _on_notice_area_2d_body_exited(_body):
	is_player_detected = false


func _on_attack_area_2d_body_entered(_body):
	is_player_in_attack_range = true


func _on_attack_area_2d_body_exited(_body):
	is_player_in_attack_range = false


func _on_attack_cooldown_timeout():
	attack_enabled = true

func hit(damage):
	if invulnerable:
		return
	health -= damage
	animator.material.set_shader_parameter('progress', 1)
	if health <= 0:
		queue_free()
	invulnerable = true
	$InvulnerableTimer.start()


func _on_invulnerable_timer_timeout():
	animator.material.set_shader_parameter('progress', 0)
	invulnerable = false
