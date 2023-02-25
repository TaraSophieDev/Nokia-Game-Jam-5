extends Sprite

onready var animation_player = $AnimationPlayer

var age: int
var hunger: int


# Called when the node enters the scene tree for the first time.
func _ready():
	age = Global.age
	hunger = Global.hunger


func _process(delta):
	match age:
		0:
			animation_player.play("age_0")
		1:
			animation_player.play("age_1")
		2:
			animation_player.play("age_2")
		3:
			animation_player.play("age_3")
		4:
			animation_player.play("age_4")

