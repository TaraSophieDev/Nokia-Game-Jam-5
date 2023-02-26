extends Node2D

var _save := SaveGame.new()

func change_scene():
	
	if _save.save_exists():
		_save.load_savegame()
		get_tree().change_scene("res://scenes/TamagotchiGame.tscn")
	else:
		get_tree().change_scene("res://scenes/NamePrompt.tscn")
