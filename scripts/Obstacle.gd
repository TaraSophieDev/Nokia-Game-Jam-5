extends Area2D

func _on_Detection_body_entered(body):
	if body.is_in_group("Player"):
		Global.score += 5


func _on_Obstacle_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit()
