extends ParallaxBackground

var background_speed = 20

func _process(delta):
	scroll_base_offset -= Vector2(background_speed, 0) * delta
