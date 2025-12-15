extends Area2D

@onready var coin_sound = $CoinSound

func _on_body_entered(body: Node2D):
	
	if body is CharacterBody2D: 
		GameManager.add_score()
		
		
		coin_sound.play()
		
		
		visible = false
		
		
		call_deferred("set_monitoring", false)
		
		
		await coin_sound.finished
		
		
		queue_free()
