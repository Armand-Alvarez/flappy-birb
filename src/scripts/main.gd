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
	get_node(game_state)


func switch_states(state: String) -> void:
	match state:
		"menu":
			var current_state = game_state
			var scene = game_states["Menu"]
			$UIContainer.add_child(scene.instantiate())
			self.get_node(current_state).queue_free()
			var menu = get_node("Menu")
			menu.on_start_button_pressed.connect(on_menu_start_button_pressed)
			menu.on_quit_button_pressed.connect(on_menu_quit_button_pressed)
			game_state = "menu"
		"game":
			var current_state = game_state
			var scene = game_states["Game"]
			self.add_child(scene.instantiate())
			self.get_node(current_state).queue_free()
			game_state = "game"

func _on_menu_start_button_pressed() -> void:
	switch_states("game")

func _on_menu_quit_button_pressed() -> void:
	get_tree().quit()
