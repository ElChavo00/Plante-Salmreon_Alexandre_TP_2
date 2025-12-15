extends CanvasLayer

@onready var score_label = $VBoxContainer/ScoreLabel
@onready var death_label = $VBoxContainer/DeathLabel

func _ready():
	score_label.text = "Pièces récoltées : " + str(GameManager.score)
	death_label.text = "Nombre de morts : " + str(GameManager.deaths)

func _on_menu_button_pressed():
	GameManager.score = 0
	GameManager.deaths = 0
	
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
