extends Area2D

func _on_body_entered(body):
	if body.name == "Player" or body is CharacterBody2D:
		
		
		if body.has_method("unlock_double_jump"):
			body.unlock_double_jump()
			
			
			
			queue_free()
