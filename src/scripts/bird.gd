class_name Bird
extends RigidBody2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		print("jump")
