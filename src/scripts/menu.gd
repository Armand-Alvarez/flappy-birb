class_name Menu
extends Control

func _on_start_button_pressed() -> void:
	SignalBus.start_button_pressed.emit()


func _on_quit_button_pressed() -> void:
	SignalBus.quit_button_pressed.emit()
