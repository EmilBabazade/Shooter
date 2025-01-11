extends StaticBody2D
class_name ItemContainerParent

@onready var current_direction = Vector2.DOWN.rotated(rotation)

signal open(pos: Vector2, direction: Vector2)
var isOpen = false

func hit():
	open_container()

func open_container(get_item_position: Callable = func(): return position, 
	emit_count: int = 1, direction: Vector2 = current_direction):
	if not isOpen:
		$LidSprite.hide()
		for i in range(0, emit_count):
			open.emit(get_item_position.call(), direction)
		isOpen = true
