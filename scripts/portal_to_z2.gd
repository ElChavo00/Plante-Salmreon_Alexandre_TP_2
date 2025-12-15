extends Area2D

@onready var teleport_sound = $TeleportSound

func _on_body_entered(body: Node2D):
	# Sécurité : on vérifie que c'est bien le joueur (pour éviter qu'un monstre ne déclenche le niveau suivant)
	if body.name == "Player" or body is CharacterBody2D:
		
		# 1. On joue le son de téléportation
		teleport_sound.play()
		
		# 2. On attend que le son finisse
		await teleport_sound.finished
		
		# 3. Ensuite, on change de scène
		call_deferred("_change_scene")

func _change_scene():
	get_tree().change_scene_to_file("res://scenes/map_2.tscn")
