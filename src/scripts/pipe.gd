class_name Pipe
extends Node2D


func _on_area_2d_body_entered(_body: Node2D) -> void:
	SignalBus.deathbox_hit.emit()
