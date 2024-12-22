class_name Pipes
extends Node2D


func _on_score_collision_body_entered(body: Node2D) -> void:
	SignalBus.scorebox_hit.emit()
