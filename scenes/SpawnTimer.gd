extends Timer


var min_time: float = 2
var max_time: float = 5

func _ready():
	randtime()
	connect("timeout", self, "randtime")
	
func _start():
	randtime()
	.start()
	
func randtime():
	set_wait_time(rand_range(min_time, max_time))
