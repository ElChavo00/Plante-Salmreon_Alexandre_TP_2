extends Area2D


@export_multiline var message: String = "Attention !"

@onready var text_box = $PanelContainer

@onready var label = $PanelContainer/Label 

func _ready():
	
	label.text = message
	text_box.visible = false 

func _on_body_entered(body: Node2D):
	if body is CharacterBody2D:
		text_box.visible = true

func _on_body_exited(body: Node2D):
	if body is CharacterBody2D:
		text_box.visible = false
