extends StaticBody2D

signal player_entered_gate

func _on_area_2d_body_entered(body: Node2D):
	player_entered_gate.emit(body)
