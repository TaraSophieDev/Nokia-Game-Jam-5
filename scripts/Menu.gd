extends CanvasLayer

signal gameover

func show_gameover():
	print(Global.run_highscore)
	$Highscore.text = "Highscore: " + String(Global.run_highscore)
	
	$TextureButton.show()
	$Highscore.show()


func _on_TextureButton_pressed():
	emit_signal("gameover")
	get_tree().reload_current_scene()
	$TextureButton.hide()
	$Highscore.hide()
