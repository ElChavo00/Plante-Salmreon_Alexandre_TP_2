extends Area2D


func _on_body_entered(body: Node2D):
	print("Le joueur est tombé !") 
	GameManager.add_death()        
	get_tree().reload_current_scene()
  
