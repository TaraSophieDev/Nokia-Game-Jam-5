extends Node

onready var name_box = $Node2D/Control/NameBox


func _ready():
	name_box.grab_focus()



func _on_NameBox_text_entered(new_text):
	Global.frog_name = new_text
	get_tree().change_scene("res://scenes/TamagotchiGame.tscn")
