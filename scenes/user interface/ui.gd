extends CanvasLayer

@onready var laser_count_label = $LaserCounter/VBoxContainer/Label as Label
@onready var laser_count_icon = $LaserCounter/VBoxContainer/TextureRect as TextureRect
@onready var grenade_count_label = $GrenadeCounter/VBoxContainer/Label as Label
@onready var grenade_count_icon = $GrenadeCounter/VBoxContainer/TextureRect as TextureRect
@onready var health_bar = $MarginContainer/TextureProgressBar as TextureProgressBar

var green: Color = Color('6bbfa3')
var red: Color = Color(0.9, 0, 0, 1)

func _ready():
	laser_count_label.modulate = green
	laser_count_icon.modulate = green
	grenade_count_label.modulate = green
	grenade_count_icon.modulate = green
	update_grenade()
	update_laser()
	update_health_bar()

func update_laser():
	laser_count_label.text = str(Globals.laser_amount)
	if Globals.laser_amount <= 0:
		laser_count_label.modulate = red
		laser_count_icon.modulate = red

func update_grenade():
	grenade_count_label.text = str(Globals.grenade_amount)
	if Globals.grenade_amount <= 0:
		grenade_count_label.modulate = red
		grenade_count_icon.modulate = red

func update_health_bar():
	health_bar.value = Globals.health
