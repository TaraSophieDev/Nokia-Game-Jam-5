extends Label

func _process(delta):
	var time = OS.get_time()
	var hour = "%02d" % time.hour
	var minute = "%02d" % time.minute
	var second = "%02d" % time.second
	
	var time_string = String(hour) + ":" + String(minute) + ":" + String(second)
	
	text = time_string
