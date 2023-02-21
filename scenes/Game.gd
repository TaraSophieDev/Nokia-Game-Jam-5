extends Node

var obstacle = preload("res://scenes/Obstacle.tscn")

func _on_Player_hit():
	$Menu.show_gameover()
	Global.saved_points += Global.score
	Global.score = 0
	print(Global.saved_points)


func _on_SpawnTimer_timeout():
	var obstacle_instance = obstacle.instance()
	obstacle_instance.position = $Position2D.position
	add_child(obstacle_instance)
