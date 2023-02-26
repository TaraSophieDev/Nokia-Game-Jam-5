extends Node

var _save = SaveGame.new()

func _ready():
	$Node2D/Control/Label.text = "You let\n" + Global.frog_name + "\nSTARVE!!!"
	$DeathAudio.play()
	
	
func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		_save.delete_savegame()
		get_tree().change_scene("res://scenes/Intro.tscn")
	
