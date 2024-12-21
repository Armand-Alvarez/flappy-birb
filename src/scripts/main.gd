class_name Main
extends Node2D


@onready var game_states = {
	"menu": preload("res://src/scripts/menu.gd"),
	"game": preload("res://src/scripts/game.gd"),
	"game_over": preload("res://src/scripts/menu.gd")
}

@onready var game_state = game_states["menu"]


