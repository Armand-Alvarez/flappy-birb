class_name Main
extends Node


const game_states = {
	"Menu": preload("res://src/scenes/menu.tscn"),
	"Game": preload("res://src/scenes/game.tscn"),
}

@onready var game_state = "Menu"
@onready var pipes_scene: PackedScene = preload("res://src/scenes/pipes.tscn")


func _ready() -> void:
	self.add_child(game_states["Menu"].instantiate())
	set_up_signalbus_connections()


func set_up_signalbus_connections() -> void:
	SignalBus.start_button_pressed.connect(_on_menu_start_button_pressed)
	SignalBus.quit_button_pressed.connect(_on_menu_quit_button_pressed)
	SignalBus.deathbox_hit.connect(_on_deathbox_hit)
	SignalBus.scorebox_hit.connect(_on_scorebox_hit)


func switch_states(state: String) -> void:
	match state:
		"Menu":
			var current_node = find_child(game_state, true, false)
			var scene_to_load = game_states["Menu"]
			$UIContainer.add_child(scene_to_load.instantiate())
			current_node.queue_free()
			game_state = "Menu"
		"Game":
			var current_node = find_child(game_state, true, false)
			var scene_to_load = game_states["Game"]
			self.add_child(scene_to_load.instantiate())
			current_node.queue_free()
			game_state = "Game"


func _on_menu_start_button_pressed() -> void:
	switch_states("Game")
	$"Spawn Timer".start()

func _on_menu_quit_button_pressed() -> void:
	get_tree().quit()

func _on_deathbox_hit() -> void:
	print("Dead")

func _on_scorebox_hit() -> void:
	print("increase score!")


func _on_destruction_box_hit(area: Area2D) -> void:
	print("Destruction area entered")
	area.get_parent().get_parent().queue_free()



func _on_spawn_timer_timeout() -> void:
	print("spawning pipe")
	var spawn_marker = $SpawnMarker
	spawn_marker.add_child(pipes_scene.instantiate())
