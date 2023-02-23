extends Control

var age: int
var points: int = Global.saved_points


# Called when the node enters the scene tree for the first time.
func _ready():
	$Points.text = String(points)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

