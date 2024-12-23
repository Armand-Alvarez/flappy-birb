class_name Pipe
extends Node2D

@export var speed: float = 1.0


func _process(delta: float) -> void:
	var new_position = self.position + Vector2(-1,0) * speed * delta
	self.position = new_position



func _on_area_2d_body_entered(_body: Node2D) -> void:
	SignalBus.deathbox_hit.emit()
