extends Sprite

onready var animation_player = $AnimationPlayer

export var very_saturated: int = 40
export var saturated: int = 70
export var hungry: int = 90
export var starving: int = 0

func _ready():
	pass

func _process(delta):
	
	print("age: ", Global.age)
	
	if Global.age >= 4.5 and Global.seen_win_screen == false:
		get_tree().change_scene("res://scenes/Win.tscn")
	elif Global.age >= 4.0:
		animation_player.play("age_4")
	elif Global.age >= 3.0:
		animation_player.play("age_3")
	elif Global.age >= 2.0:
		animation_player.play("age_2")
	elif Global.age >= 1.0:
		animation_player.play("age_1")
	else:
		animation_player.play("age_0")
	#match Global.age:
	#	0.0:
	#		animation_player.play("age_0")
	#	1.0:
	#		animation_player.play("age_1")
	#	2.0:
	#		animation_player.play("age_2")
	#	3.0:
	#		animation_player.play("age_3")
	#	4.0:
	#		animation_player.play("age_4")
	
	if Global.age <= 1.0:
		Global.age += delta / 10
	
	if Global.hunger >= 70:
		Global.age += delta / very_saturated
		$Heart.show()
		$Heart/HeartAnimationPlayer.play("heart")
	elif Global.hunger <= 0:
		get_tree().change_scene("res://scenes/Death.tscn")
	elif Global.hunger <= 15:
		Global.age += delta * starving
		$Hunger.show()
		$Hunger/HungerAnimationPlayer.play("hunger", -1, 2.0)
		$SadFace.show()
		$SadFace/SadFaceAnimationPlayer.play("sad")
		$Heart.hide()
		$Heart/HeartAnimationPlayer.stop()
	elif Global.hunger <= 30:
		Global.age += delta / hungry
		$Hunger.show()
		$Hunger/HungerAnimationPlayer.play("hunger", -1, 1.0)
		$Heart.hide()
		$Heart/HeartAnimationPlayer.stop()
	else:
		Global.age += delta / saturated
		$Hunger.hide()
		$Hunger/HungerAnimationPlayer.stop()
		$SadFace.hide()
		$SadFace/SadFaceAnimationPlayer.stop()
		$Heart.hide()
		$Heart/HeartAnimationPlayer.stop()
		


func _on_HungerTimer_timeout():
	if Global.age >= 4.0:
		Global.hunger -= 0
	elif Global.age >= 3.0:
		Global.hunger -= 5
	elif Global.age >= 2.0:
		Global.hunger -= 3
	elif Global.age >= 1.0:
		Global.hunger -= 1
	else:
		Global.hunger -= 0.25
	print("Hunger triggered: ", Global.hunger)
