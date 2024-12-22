class_name Main
extends Node2D


const game_states = {
	"Menu": preload("res://src/scenes/menu.tscn"),
	"Game": preload("res://src/scenes/game.tscn"),
}
const game_state_node_names = {
	"menu": "Menu",
	"game": "Game",
}

@onready var game_state = "menu"


func _ready() -> void:

	var ui_container: CenterContainer = $UIContainer
	ui_container.add_child(game_states["Menu"].instantiate())
	SignalBus.start_button_pressed.connect(_on_menu_start_button_pressed)
	SignalBus.quit_button_pressed.connect(_on_menu_quit_button_pressed)


func switch_states(state: String) -> void:
	match state:
		"menu":
			var current_state = game_state
			var scene = game_states["Menu"]
			$UIContainer.add_child(scene.instantiate())
			self.get_node(current_state).queue_free()
			game_state = "menu"
		"game":
			self.print_tree()
			var current_state = game_state
			var current_node_name = game_state_node_names[current_state]
			var current_node = find_child(current_node_name, true, false)
			var scene = game_states["Game"]
			self.add_child(scene.instantiate())
			current_node.queue_free()
			game_state = "game"


func _on_menu_start_button_pressed() -> void:
	switch_states("game")

func _on_menu_quit_button_pressed() -> void:
	get_tree().quit()
