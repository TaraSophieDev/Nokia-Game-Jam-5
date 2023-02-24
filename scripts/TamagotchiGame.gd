extends Node

onready var idle_screen = $UI/IdleScreen
onready var menu = $UI/Menu
onready var stats_menu = $UI/StatsMenu
onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_RunButton_pressed():
	get_tree().change_scene("res://scenes/RunGame.tscn")
	
func _input(event):
	if Input.is_action_just_pressed("ok") and not menu.is_visible_in_tree():
		idle_screen.hide()
		menu.show()
		$UI/Menu/VBoxContainer/StatsButton.grab_focus()
		$IdleTimer.start()


func _on_IdleTimer_timeout():
	menu.hide()
	idle_screen.show()


func _on_StatsButton_pressed():
	menu.hide()
	player.hide()
	stats_menu.show()
	


func _on_FoodButton_pressed():
	pass


func _on_SaveButton_pressed():
	pass # Replace with function body.
