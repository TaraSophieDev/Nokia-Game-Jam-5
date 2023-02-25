extends Node

onready var idle_screen_ui = $UI/IdleScreen
onready var menu_ui = $UI/Menu
onready var stats_ui = $UI/StatsMenu
onready var player = $Player
onready var idle_timer = $IdleTimer


enum {
	MENU,
	STATS,
	IDLE
}

var ui_state = MENU


# Called when the node enters the scene tree for the first time.
func _ready():
	ui_state = MENU
	$UI/Menu/VBoxContainer/StatsButton.grab_focus()
	

func _process(delta):
	match ui_state:
		IDLE:
			print("idle")
			menu_ui.hide()
			stats_ui.hide()
			idle_screen_ui.show()
			player.show()
		MENU:
			print("menu")
			idle_screen_ui.hide()
			stats_ui.hide()
			menu_ui.show()
			player.show()
		STATS:
			print("stats")
			idle_screen_ui.hide()
			menu_ui.hide()
			player.hide()
			stats_ui.show()
			

func _on_RunButton_pressed():
	get_tree().change_scene("res://scenes/RunGame.tscn")
	

func _on_IdleTimer_timeout():
	ui_state = IDLE


func _on_StatsButton_pressed():
	ui_state = STATS
	idle_timer.start()
	


func _on_FoodButton_pressed():
	pass


func _on_SaveButton_pressed():
	pass # Replace with function body.



func _on_back_to_menu():
	ui_state = MENU
	# This makes the button focused after a frame, bc it wouldn't work else (tried to grab focus when not even visible)
	# Thank you so much Alice <3
	yield(get_tree(), "idle_frame")
	$UI/Menu/VBoxContainer/StatsButton.grab_focus()
	idle_timer.start()
