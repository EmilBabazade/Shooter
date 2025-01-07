extends CharacterBody2D

var speed: float = 500
var can_laser: bool = true
var can_grenade: bool = true
var laserTimer: Timer
var grenadeTimer: Timer
signal laser_shot(pos: Vector2, direction: Vector2)
signal grenade_thrown(pos: Vector2, direction: Vector2)

func _process(_delta):
	handle_input()
	laserTimer = $LaserTimer
	grenadeTimer = $GrenadeTimer

func handle_input():
	look_at(get_global_mouse_position())
#sprint
	if Input.is_action_just_pressed('sprint'):
		speed *= 2
	if Input.is_action_just_released('sprint'):
		speed /= 2
#movement
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	velocity = speed * direction
	move_and_slide()
#shooting
	var player_driection = position.direction_to(get_global_mouse_position())
	if Input.is_action_pressed('primary') and can_laser:		
		can_laser = false
		laserTimer.start()
		laser_shot.emit(get_projectile_start_position(), player_driection)
		($LaserParticles as GPUParticles2D).emitting = true
		
	if Input.is_action_pressed('secondary') and can_grenade:
		can_grenade = false
		grenadeTimer.start()
		grenade_thrown.emit(get_projectile_start_position(), player_driection)

func _on_laser_timer_timeout():
	can_laser = true

func _on_grenade_timer_timeout():
	can_grenade = true

func get_projectile_start_position() -> Vector2:
	var marker = $LaserStartPosition.get_children()[randi() % 3]
	return marker.global_position
