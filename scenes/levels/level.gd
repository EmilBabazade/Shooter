extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload('res://scenes/projectiles/laser.tscn')
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_player_grenade_thrown(pos: Vector2, direction: Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade()

func _on_player_laser_shot(pos: Vector2, direction: Vector2):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle())
	$Projectiles.add_child(laser)
	$UI.update_laser()

func _on_house_player_entered():
	zoom_camera(Vector2(1, 1))


func _on_house_player_exited():
	zoom_camera(Vector2(.6, .6))

func zoom_camera(zoom: Vector2):
	var tween = create_tween()
	tween.tween_property($Player/Camera2D, 'zoom', zoom, 1)
