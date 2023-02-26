extends Control

onready var player = $"../../Player"

signal back_to_menu

func _ready():
	$VBoxContainer/Name.text = String(Global.frog_name)


# Called when the node enters the scene tree for the first time.
func _process(delta):
	$VBoxContainer/Age.text = "Age: " + String("%2.2f" % Global.age)
	$VBoxContainer/Hunger.text = "Hunger: " + String(Global.hunger)
	$VBoxContainer/Highscore.text = "Score: " + String(Global.run_highscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		emit_signal("back_to_menu")
