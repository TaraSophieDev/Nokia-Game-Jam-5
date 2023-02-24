extends CanvasLayer

signal gameover

func show_gameover():
	print(Global.run_highscore)
	$Highscore.text = "Highscore: " + String(Global.run_highscore)
	
	$Retry.show()
	$Highscore.show()
	$Tamagotchi.show()


func _on_Retry_pressed():
	emit_signal("gameover")
	get_tree().reload_current_scene()
	$Retry.hide()
	$Highscore.hide()
	$Tamagotchi.hide()


func _on_Tamagotchi_pressed():
	get_tree().change_scene("res://scenes/TamagotchiGame.tscn")
