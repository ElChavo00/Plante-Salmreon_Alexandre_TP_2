extends CanvasLayer

# On récupère le gestionnaire d'arbre (l'arbre des scènes)
@onready var resume_button = $CenterContainer/VBoxContainer/ResumeButton
@onready var restart_button = $CenterContainer/VBoxContainer/RestartButton
@onready var quit_button = $CenterContainer/VBoxContainer/QuitButton

func _ready():
	# Au lancement, on cache le menu
	visible = false 
	
	# On connecte les signaux des boutons (équivalent du onClick)
	resume_button.pressed.connect(_on_resume_pressed)
	restart_button.pressed.connect(_on_restart_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _input(event):
	# "ui_cancel" est mappé sur ESC par défaut dans Godot
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	# On inverse l'état de pause (Vrai devient Faux, Faux devient Vrai)
	var is_paused = !get_tree().paused
	get_tree().paused = is_paused
	
	# On affiche ou cache le menu selon l'état
	visible = is_paused

func _on_resume_pressed():
	toggle_pause() # On enlève la pause

func _on_restart_pressed():
	toggle_pause() # IMPORTANT : Il faut enlever la pause avant de recharger !
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()
