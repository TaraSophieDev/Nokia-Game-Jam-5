extends Control

onready var menu = $"../Menu"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Age.text = "Age: " + String(Global.age)
	$VBoxContainer/Hunger.text = "Hunger: " + String(Global.hunger)
	$VBoxContainer/Highscore.text = "Highscore: " + String(Global.run_highscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		hide()
		menu.show()
