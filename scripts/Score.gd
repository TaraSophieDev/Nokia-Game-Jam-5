extends Label

func _ready():
	pass 


func _process(delta):
	text = String(Global.score)



func _on_ScoreTimer_timeout():
	Global.score += 1
