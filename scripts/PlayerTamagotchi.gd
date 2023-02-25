extends Sprite

onready var animation_player = $AnimationPlayer


func _process(delta):
	Global.hunger = 1
	
	match Global.age:
		0.0:
			animation_player.play("age_0")
		1.0:
			animation_player.play("age_1")
		2.0:
			animation_player.play("age_2")
		3.0:
			animation_player.play("age_3")
		4.0:
			animation_player.play("age_4")
	
	if Global.hunger >= 75:
		$Heart.show()
		$Heart/HeartAnimationPlayer.play("heart")
	elif Global.hunger <= 5:
		$Hunger.show()
		$Hunger/HungerAnimationPlayer.play("hunger", -1, 2.0)
		$SadFace.show()
		$SadFace/SadFaceAnimationPlayer.play("sad")
		$Heart.hide()
		$Heart/HeartAnimationPlayer.stop()
	elif Global.hunger <= 25:
		$Hunger.show()
		$Hunger/HungerAnimationPlayer.play("hunger", -1, 1.0)
		$Heart.hide()
		$Heart/HeartAnimationPlayer.stop()
	else:
		$Hunger.hide()
		$Hunger/HungerAnimationPlayer.stop()
		$SadFace.hide()
		$SadFace/SadFaceAnimationPlayer.stop()
		$Heart.hide()
		$Heart/HeartAnimationPlayer.stop()
		
