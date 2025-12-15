extends CanvasLayer


@onready var score_label: Label = $Control/VBoxContainer/HBoxContainer/ScoreLabel
@onready var death_label: Label = $Control/VBoxContainer/HBoxContainer2/DeathLabel



func _ready():
	
	update_score_text(GameManager.score)
	update_death_text(GameManager.deaths)
	
	
	GameManager.score_updated.connect(update_score_text)
	GameManager.deaths_updated.connect(update_death_text)


func update_score_text(new_value):
	score_label.text = "Pièces : " + str(new_value)


func update_death_text(new_value):
	death_label.text = "Morts : " + str(new_value)
