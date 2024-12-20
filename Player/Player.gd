extends CharacterBody2D

const ACCELERATION = 10
const MAX_SPEED = 200
const FRICTION = 10

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	# vector.normalized > para que el pj no vaya más rápido en diagonal
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		# probar quitar o poner delta
		velocity = velocity.limit_length(MAX_SPEED * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	# probar quitar o poner delta
	move_and_collide(velocity )
