extends Control

var age: int
var points: int = Global.saved_points


func _ready():
	$Points.text = String(points)
