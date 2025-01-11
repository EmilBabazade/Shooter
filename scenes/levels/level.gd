extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload('res://scenes/projectiles/laser.tscn')
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload('res://scenes/items/item.tscn')

func _ready():
	var containers = get_tree().get_nodes_in_group('container') as Array[ItemContainerParent]
	for c in containers:
		c.connect('open', on_container_opened)

func on_container_opened(pos: Vector2, direction: Vector2):
	var item = item_scene.instantiate() as Area2D
	item.position = pos
	item.direction = direction
	$Items.call_deferred('add_child', item)

func _on_player_grenade_thrown(pos: Vector2, direction: Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)

func _on_player_laser_shot(pos: Vector2, direction: Vector2):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle())
	$Projectiles.add_child(laser)

func _on_house_player_entered():
	zoom_camera(Vector2(1, 1))


func _on_house_player_exited():
	zoom_camera(Vector2(.6, .6))

func zoom_camera(zoom: Vector2):
	var tween = create_tween()
	tween.tween_property($Player/Camera2D, 'zoom', zoom, 1)
