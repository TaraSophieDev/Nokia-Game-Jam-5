extends ParallaxBackground


func _process(delta):
	scroll_base_offset -= Vector2(20, 0) * delta
