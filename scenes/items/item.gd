extends Area2D

var rotation_speed: int = 4
var avaible_types = ['laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = avaible_types[randi() % len(avaible_types)]

var direction: Vector2
var distance = randi_range(150, 250)

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0.1, 0.2, 0.8)
	if type == 'grenade':
		$Sprite2D.modulate = Color(0.8, 0.2, 0.1)
	if type == 'health':
		$Sprite2D.modulate = Color(0.1, 0.8, 0.1)
	
	var target_pos = position + distance * direction
	var tween = create_tween()
	tween.set_parallel()
	tween.tween_property(self, 'position', target_pos, 1)
	tween.tween_property(self, 'scale', Vector2(1,1), 0.3).from(Vector2(0,0))

func _process(delta):
	rotation += rotation_speed * delta

func _on_body_entered(_body):
	match type:
		'laser':
			Globals.laser_amount += 5
		'grenade':
			Globals.grenade_amount += 1
		'health':
			if(Globals.health < 100):
				Globals.health = Globals.health + 10
	queue_free()
