extends ParallaxBackground

var background_speed = 20

func _process(delta):
	
	if background_speed < 200:
		background_speed += (delta / 8)
	
	scroll_base_offset -= Vector2(background_speed, 0) * delta
