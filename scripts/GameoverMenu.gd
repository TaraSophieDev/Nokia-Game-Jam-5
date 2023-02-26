extends CanvasLayer

var _save = SaveGame.new()

onready var game_over_ui = $GameOverUI
onready var highscore = $GameOverUI/Highscore

signal gameover

	
func show_gameover():
	highscore.text = "Highscore: " + String(Global.run_highscore)
	game_over_ui.show()
	$GameOverUI/Retry.grab_focus()


func _on_Retry_pressed():
	emit_signal("gameover")
	get_tree().reload_current_scene()
	game_over_ui.hide()


func _on_Tamagotchi_pressed():
	_save.write_savegame()
	get_tree().change_scene("res://scenes/TamagotchiGame.tscn")
