extends CharacterBody2D

var speed: int = 200
var acceleration: int = 2
var player_detected = false
var exploding = false

@onready var animation_player = $AnimationPlayer as AnimationPlayer

var entities: Array[Node2D] = []

func _ready():
	$ExplosionSprite.frame = 0
	($Sprite2D as Sprite2D).visible = true

func _process(_delta):
	if player_detected:
		var direction = position.direction_to(Globals.player_position)
		velocity = speed * direction
		speed += acceleration
		move_and_slide()
	if get_slide_collision_count() > 0:
		start_explosion()
	if exploding:
		for e in entities:
			if 'hit' in e:
				e.hit(20)

func hit(_damage):
	start_explosion()


func _on_area_2d_body_entered(body):
	player_detected = true


func _on_explosion_range_body_entered(body: Node2D):
	if body.is_in_group('entity'):
		entities.append(body)

func start_explosion():
	animation_player.play('explosion')
	collision_layer = 0
	collision_mask = 0
	speed = 0
	acceleration = 0

func explode():
	exploding = true


func _on_explosion_range_body_exited(body: Node2D):
	if body.is_in_group('entity'):
		var index = entities.find(body)
		if index != -1:
			entities.remove_at(index)
