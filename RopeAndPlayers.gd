extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var force = 5000


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_just_released("p1_push"):
		var force = $Player1.fart()
		apply_central_impulse(Vector2(-1,0)*force*delta)

	if Input.is_action_just_released("p2_push"):
		var force = $Player2.fart()
		apply_central_impulse(Vector2(1,0)*force*delta)

	if Input.is_action_pressed("p1_push"):
		$Player1.chargeFart()

	if Input.is_action_pressed("p2_push"):
		$Player2.chargeFart()


