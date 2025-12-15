extends Area2D

@onready var teleport_sound = $TeleportSound

func _on_body_entered(body: Node2D):
	
	if body.name == "Player" or body is CharacterBody2D:
		

		teleport_sound.play()
		

		await teleport_sound.finished

		call_deferred("_change_scene")

func _change_scene():
	get_tree().change_scene_to_file("res://scenes/map_2.tscn")
