extends Area2D

onready var speed = get_parent().get_node("ParallaxBackground").background_speed

func _process(delta):
	position += Vector2.LEFT * speed * delta

func _on_Detection_body_entered(body):
	if body.is_in_group("Player"):
		Global.score += 3


func _on_Obstacle_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
