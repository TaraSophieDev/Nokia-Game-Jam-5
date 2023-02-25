extends Node

var obstacle = preload("res://scenes/Obstacle.tscn")

func _on_Player_hit():
	
	Global.money += Global.score
	if Global.run_highscore <= Global.score:
		Global.run_highscore = Global.score
	$GameOverMenu.show_gameover()
	Global.score = 0
	print(Global.run_highscore)


func _on_SpawnTimer_timeout():
	var obstacle_instance = obstacle.instance()
	obstacle_instance.position = $Position2D.position
	add_child(obstacle_instance)
