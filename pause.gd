extends Control

@onready var optionsMenu = preload("res://scenes/pause.tscn")
func _ready():
	$AnimationPlayer.play("RESET")


func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()




func _process(delta):
	testEsc()


func _on_resumer_pressed():
	resume()


func _on_quitter_pressed():
	get_tree().quit()


func _on_recommencer_pressed():
	get_tree().reload_current_scene()
