class_name Bird
extends RigidBody2D

@export var jump_multiplier: float = 100
@export var scale_multiplier = 3



func _ready() -> void:
	SignalBus.deathbox_hit.connect(_on_deathbox_hit)
	$Sprite2D.set_scale(scale_multiplier * Vector2.ONE)
	$CollisionPolygon2D.set_scale(scale_multiplier * Vector2.ONE)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		set_linear_velocity(Vector2.UP * jump_multiplier)


func _on_deathbox_hit() -> void:
	self.set_process(false)
	$CollisionPolygon2D.queue_free()
