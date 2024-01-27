extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_AreaP1Win_area_entered(area):
	print("GANO JUGADOR 1")
	get_tree().paused = true
	$Player1WinLabel.show()
	$RestartTimer.start()


func _on_AreaP2Win_area_entered(area):
	print("GANO JUGADOR 2")
	get_tree().paused = true
	$Player2WinLabel.show()
	$RestartTimer.start()


func _on_RestartTimer_timeout():
	get_tree().reload_current_scene()
	get_tree().paused = false
