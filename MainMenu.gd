extends Control

func _ready():
	OS.window_maximized = true

func _input(event):
	if event is InputEventKey and event.scancode == KEY_A and event.pressed:
		get_tree().change_scene("res://main.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://main.tscn")
