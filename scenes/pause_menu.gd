extends CanvasLayer


@onready var resume_button = $CenterContainer/VBoxContainer/ResumeButton
@onready var restart_button = $CenterContainer/VBoxContainer/RestartButton
@onready var quit_button = $CenterContainer/VBoxContainer/QuitButton

func _ready():
	
	visible = false 
	
	
	resume_button.pressed.connect(_on_resume_pressed)
	restart_button.pressed.connect(_on_restart_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _input(event):
	
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	
	var is_paused = !get_tree().paused
	get_tree().paused = is_paused
	
	
	visible = is_paused

func _on_resume_pressed():
	toggle_pause() 

func _on_restart_pressed():
	toggle_pause()
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()
