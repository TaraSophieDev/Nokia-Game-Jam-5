extends Node

onready var name_box = $Node2D/Control/NameBox

var _save := SaveGame.new()

func _ready():
	name_box.grab_focus()



func _on_NameBox_text_entered(new_text):
	Global.frog_name = new_text
	_save.write_savegame()
	get_tree().change_scene("res://scenes/TamagotchiGame.tscn")

func create_save():
	_save.write_savegame()
