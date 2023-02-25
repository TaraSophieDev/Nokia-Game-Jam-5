extends Control

signal back_to_menu


func _input(event):
	if Input.is_action_just_pressed("ok") and is_visible_in_tree():
		emit_signal("back_to_menu")
		
