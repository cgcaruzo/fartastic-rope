extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const basicForce = 5000
const maxFartForce = 10000
enum Direction {LEFT = -1, RIGHT = 1}
export(Direction) var faceDirection = Direction.LEFT
enum IndicatorPos { START, END }
var tween_pos = 0
var isChargingFart = false
var fartCharge = 0
var indicatorInitialCharge = 0.2
var indicatorEndCharge = 1
var indicatorTime = 1
var indicatorTransition = Tween.TRANS_CUBIC

# Called when the node enters the scene tree for the first time.
func _ready():
	var fartDirection = -1 * faceDirection
	$AnimatedSprite.play()
	$AnimatedSprite.flip_h = faceDirection == Direction.LEFT
	$CPUParticles2D.direction.x = fartDirection
	$Tween.interpolate_property($FartIndicator, "scale",
			Vector2(indicatorInitialCharge,indicatorInitialCharge), Vector2(indicatorEndCharge,indicatorEndCharge), indicatorTime,
			indicatorTransition , Tween.EASE_IN)
#	tween.start()
	pass # Replace with function body.

func _physics_process(delta):
	fartCharge = $FartIndicator.scale.x
#	print($Tween.is_active())
	$FartChargeLabel.text = String(fartCharge)
	pass
#	move_and_slide(Vector2(direction,0)*speed*delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func fart():
#	print("FART")
	isChargingFart = false
	$Tween.stop_all()
	$Tween.reset_all()
	
	$FartIndicator.hide()
	$CPUParticles2D.restart()
	$CPUParticles2D.emitting = true
	var fartForce = fartCharge*maxFartForce
	fartCharge = 0
	$FartChargeLabel.text = String(fartCharge)
	var randomFart = randi() % $FartSounds.get_child_count()
	print(randomFart)
	$FartSounds.get_child(randomFart).play()
	return fartForce
	
func chargeFart():
#	print("CHARGEFART")
	if !isChargingFart:
		$Tween.interpolate_property($FartIndicator, "scale",
			Vector2(indicatorInitialCharge,indicatorInitialCharge), Vector2(indicatorEndCharge,indicatorEndCharge), indicatorTime,
			indicatorTransition , Tween.EASE_IN)
		$FartIndicator.show()
		$Tween.start()
	isChargingFart = true
#	if fartCharge <= maxFartCharge:
#		fartCharge += delta*maxFartCharge
#	$FartChargeLabel.text = String(fartCharge)
	


func _on_Tween_tween_completed(object, key):
	if tween_pos == 0:
		tween_pos = 1
		$Tween.interpolate_property($FartIndicator, "scale",
			Vector2(indicatorEndCharge,indicatorEndCharge), Vector2(indicatorInitialCharge,indicatorInitialCharge), indicatorTime,
			indicatorTransition , Tween.EASE_OUT)

	else:
		tween_pos = 0
		$Tween.interpolate_property($FartIndicator, "scale",
			Vector2(indicatorInitialCharge,indicatorInitialCharge), Vector2(indicatorEndCharge,indicatorEndCharge), indicatorTime,
			indicatorTransition , Tween.EASE_IN)
	$Tween.start()

	pass # Replace with function body.
