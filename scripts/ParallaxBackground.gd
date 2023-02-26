extends ParallaxBackground

var background_speed: float = 20
var speed_modifier: float = 8

func _process(delta):
	
	if Global.age >= 4.0:
		background_speed = 40
		speed_modifier = 2
	elif Global.age >= 3.0:
		background_speed = 30
		speed_modifier = 3
	elif Global.age >= 2.0:
		background_speed = 25
		speed_modifier = 5
	else:
		background_speed = 20
		speed_modifier = 7
		
	
	if background_speed < 200:
		background_speed += (delta / speed_modifier)
	
	scroll_base_offset -= Vector2(background_speed, 0) * delta
