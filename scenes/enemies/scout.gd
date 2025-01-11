extends CharacterBody2D

signal laser(pos: Vector2, direction: Vector2)

var player_nearby = false
var can_laser = true
var right_gun = true
var health = 30
var vunrelable = true

func _process(delta):
	look_at(Globals.player_position)
	if player_nearby and can_laser:
		var spawn_marker = $LaserSpawns/Marker2D if right_gun else $LaserSpawns/Marker2D2
		var direction = position.direction_to(Globals.player_position)
		laser.emit(spawn_marker.global_position, direction)
		#can_laser = false
		$LaserCooldownTimer.start()


func _on_range_body_entered(body):
	player_nearby = true


func _on_range_body_exited(body):
	player_nearby = false


func _on_laser_cooldown_timer_timeout():
	can_laser = true

func hit(damage: int):
	if vunrelable:
		health -= damage
		vunrelable = false
		$DamagableTimer.start()
	if health <= 0:
		queue_free()


func _on_damagable_timer_timeout():
	vunrelable = true
