extends ParallaxBackground


func _process(delta):
	scroll_base_offset -= Vector2(6, 0) * delta
