extends Node



func _on_Player_hit():
	$Menu.show_gameover()
	Global.saved_points += Global.score
	Global.score = 0
	print(Global.saved_points)
