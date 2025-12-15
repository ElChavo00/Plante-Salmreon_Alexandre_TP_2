extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D):
	# On vérifie que c'est le joueur
	if body.name == "Player" or body is CharacterBody2D:
		GameManager.add_death() # <--- AJOUT : On compte la mort
		print("Morts : ", GameManager.morts) # Pour vérifier dans la console
		
		# Ici tu peux ajouter un petit délai si tu veux, ou recharger tout de suite
		get_tree().reload_current_scene()
