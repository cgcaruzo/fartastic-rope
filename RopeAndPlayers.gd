extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum Direction {LEFT = -1, RIGHT = 1}
var force = 5000


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_just_pressed("p1_push"):
		apply_central_impulse(Vector2(-1,0)*force*delta)
	if Input.is_action_just_pressed("p2_push"):
		apply_central_impulse(Vector2(1,0)*force*delta)



