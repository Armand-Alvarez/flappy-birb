class_name Menu
extends Control


signal start_button_pressed
signal quit_button_pressed


func _on_start_button_pressed() -> void:
	start_button_pressed.emit()


func _on_quit_button_pressed() -> void:
	quit_button_pressed.emit()
