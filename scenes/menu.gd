extends Control



func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	pass


func _on_commencer_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")


func _on_quitter_pressed() -> void:
	get_tree().quit()
