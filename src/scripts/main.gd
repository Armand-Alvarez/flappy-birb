class_name Main
extends Node


const game_scenes = {
	"Menu": preload("res://src/scenes/menu.tscn"),
	"Game": preload("res://src/scenes/game.tscn"),
}

const game_states = [
	"Menu",
	"Game",
	"Death",
]

@onready var pipes_scene: PackedScene = preload("res://src/scenes/pipes.tscn")
@onready var score = 0


func _ready() -> void:
	self.add_child(game_scenes["Menu"].instantiate())
	set_up_signalbus_connections()
	$ScoreLabel.hide()


func _process(_delta: float) -> void:
	$ScoreLabel.text = str(score)


func set_up_signalbus_connections() -> void:
	SignalBus.start_button_pressed.connect(_on_menu_start_button_pressed)
	SignalBus.quit_button_pressed.connect(_on_menu_quit_button_pressed)
	SignalBus.deathbox_hit.connect(_on_deathbox_hit)
	SignalBus.scorebox_hit.connect(_on_scorebox_hit)


func switch_states(state_to_load: String) -> void:
	print("switching state to " + state_to_load)
	match state_to_load:
		"Menu":
			clear_states()
			var scene_to_load = game_scenes["Menu"]
			self.add_child(scene_to_load.instantiate())
		"Game":
			clear_states()
			var scene_to_load = game_scenes["Game"]
			self.add_child(scene_to_load.instantiate())
			score = 0
			$ScoreLabel.show()
		"Death":
			self.add_child(game_scenes["Menu"].instantiate())

func clear_states() -> void:
	for node in get_tree().get_nodes_in_group("ScenesToDelete"):
		node.queue_free()


func _on_menu_start_button_pressed() -> void:
	switch_states("Game")
	$"Spawn Timer".start()

func _on_menu_quit_button_pressed() -> void:
	get_tree().quit()

func _on_deathbox_hit() -> void:
	switch_states("Death")

func _on_scorebox_hit() -> void:
	score += 1


func _on_destruction_box_hit(area: Area2D) -> void:
	area.get_parent().get_parent().queue_free()



func _on_spawn_timer_timeout() -> void:
	var spawn_marker = $SpawnMarker
	spawn_marker.add_child(pipes_scene.instantiate())


func _on_deathbox_body_entered(_body: Node2D) -> void:
	SignalBus.deathbox_hit.emit()
