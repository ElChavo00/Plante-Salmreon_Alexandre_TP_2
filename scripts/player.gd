extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

const FALL_LIMIT = 2000 

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var has_double_jump_item = false

var jumps_made = 0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound = $JumpSound

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta


	if global_position.y > FALL_LIMIT:
		die() 

	
	if is_on_floor():
		jumps_made = 0

	# Gestion du Saut
	if Input.is_action_just_pressed("ui_accept"):
		
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			jump_sound.play()
		
		
		elif has_double_jump_item and jumps_made < 1:
			velocity.y = JUMP_VELOCITY 
			jumps_made += 1 
			jump_sound.play()  
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func die():
	print("Le joueur est mort !")
	
	
	GameManager.add_death()
	
	
	get_tree().reload_current_scene()

func unlock_double_jump():
	has_double_jump_item = true
	print("Double saut activé !")
