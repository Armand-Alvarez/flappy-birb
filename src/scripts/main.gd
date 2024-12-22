class_name Main
extends Node


const game_states = {
	"Menu": preload("res://src/scenes/menu.tscn"),
	"Game": preload("res://src/scenes/game.tscn"),
}

@onready var game_state = "Menu"


func _ready() -> void:
	self.add_child(game_states["Menu"].instantiate())
	SignalBus.start_button_pressed.connect(_on_menu_start_button_pressed)
	SignalBus.quit_button_pressed.connect(_on_menu_quit_button_pressed)


func switch_states(state: String) -> void:
	match state:
		"Menu":
			var current_node = find_child(game_state, true, false)
			var scene_to_load = game_states["Menu"]
			$UIContainer.add_child(scene_to_load.instantiate())
			current_node.queue_free()
			game_state = "Menu"
		"Game":
			self.print_tree()
			var current_node = find_child(game_state, true, false)
			var scene_to_load = game_states["Game"]
			self.add_child(scene_to_load.instantiate())
			current_node.queue_free()
			game_state = "Game"


func _on_menu_start_button_pressed() -> void:
	switch_states("Game")

func _on_menu_quit_button_pressed() -> void:
	get_tree().quit()
