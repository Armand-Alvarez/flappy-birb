class_name Pipes
extends Node2D

@export var y_offset_range_min = 0
@export var y_offset_range_max = 400


func _ready() -> void:
	var rand_offset = randf_range(y_offset_range_min, y_offset_range_max)
	position = Vector2(position.x, position.y + rand_offset)

func _on_score_collision_body_entered(_body: Node2D) -> void:
	SignalBus.scorebox_hit.emit()
