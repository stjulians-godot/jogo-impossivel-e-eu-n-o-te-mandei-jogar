extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $Animations

const SPEED = 400.0
const JUMP_VELOCITY = -400.0
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta  
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction > 0:
		animations.scale.x = 7
	elif direction < 0:
		animations.scale.x = -7
	if direction:
		velocity.x = direction * SPEED
		animations.play('running 1')
	else:
		velocity.x = 0
		animations.play('idle')

	move_and_slide()  


func _on_area_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
