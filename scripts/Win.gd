extends Node

var _save = SaveGame.new()

func _ready():
	#_save.load_savegame()
	$Node2D/Control/Label.text = "You and\n" + Global.frog_name + " Won" 
	$Node2D/Control/HBoxContainer/HomeButton.grab_focus()
	Global.seen_win_screen = true


func _on_HomeButton_pressed():
	_save.write_savegame()
	get_tree().change_scene("res://scenes/TamagotchiGame.tscn")

