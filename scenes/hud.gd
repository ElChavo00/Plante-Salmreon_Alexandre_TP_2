extends CanvasLayer

# On récupère les Labels qui sont dans les sous-scènes score et score2
# Vérifie bien que le chemin correspond à ton arbre de scène !
@onready var score_label = $Control/VBoxContainer/score/Label
@onready var morts_label = $Control/VBoxContainer/score2/Label

func _process(delta):
	# À chaque image, on met à jour le texte avec les valeurs globales
	score_label.text = str(GameManager.score)
	morts_label.text = str(GameManager.morts)
