extends CanvasLayer

signal gameover

func show_gameover():
	$TextureButton.show()


func _on_TextureButton_pressed():
	emit_signal("gameover")
	get_tree().reload_current_scene()
	$TextureButton.hide()
