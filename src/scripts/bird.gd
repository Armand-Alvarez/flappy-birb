class_name Bird
extends RigidBody2D

@export var jump_multiplier: float = 100


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		print("jump")
		set_linear_velocity(Vector2.UP * jump_multiplier)
