class_name Pipes
extends Node2D

@export var y_offset_range_min = 0
@export var y_offset_range_max = 400
@export var speed: float = 100

func _ready() -> void:
	var rand_offset = randf_range(y_offset_range_min, y_offset_range_max)
	position = Vector2(position.x, position.y + rand_offset)


func _process(delta: float) -> void:
	var new_position = self.position + Vector2(-1,0) * speed * delta
	self.position = new_position


func _on_score_collision_body_entered(_body: Node2D) -> void:
	SignalBus.scorebox_hit.emit()
