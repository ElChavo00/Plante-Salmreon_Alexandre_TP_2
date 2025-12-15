extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Récupère la gravité définie dans les paramètres du projet
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# On récupère les composants (le sprite et le son)
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound = $JumpSound  # <--- C'est ici qu'on lie le nœud de son

func _physics_process(delta):
	# Applique la gravité si on n'est pas au sol
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Gestion du saut
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play() # <--- On joue le son ici !
		print("Saut déclenché !") # Petit message de vérification dans la console
	
	# Récupère la direction (gauche/droite)
	var direction = Input.get_axis("ui_left", "ui_right")
	
	# Gère l'orientation du sprite (regarde à gauche ou à droite)
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	# Applique le mouvement horizontal
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Déplace le personnage en gérant les collisions
	move_and_slide()
