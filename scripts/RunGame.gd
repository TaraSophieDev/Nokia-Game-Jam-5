extends Node

var obstacle = preload("res://scenes/Obstacle.tscn")

func _on_Player_hit():
	$HitAudio.play()
	Global.money += Global.score
	if Global.run_highscore <= Global.score:
		Global.run_highscore = Global.score
	$GameOverMenu.show_gameover()
	Global.score = 0
	$Node2D/Control/Score.hide()


func _on_SpawnTimer_timeout():
	var obstacle_instance = obstacle.instance()
	obstacle_instance.position = $Position2D.position
	add_child(obstacle_instance)
