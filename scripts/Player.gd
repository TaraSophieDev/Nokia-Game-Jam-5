extends KinematicBody2D

onready var sprite = $Sprite

signal hit

var health: int = 1
var velocity = Vector2.ZERO
var has_jumped: bool = false

export var jump_peak_time: float = 0.5
export var jump_height = 40.0
export var gravity = 50.0

#onready var animation = $AnimatedSprite

func _process(delta):
	if Global.age >= 4.0:
		sprite.frame = 3
		jump_height = 55
	elif Global.age >= 3.0:
		sprite.frame = 2
		jump_height = 50
	elif Global.age >= 2.0:
		sprite.frame = 1
		jump_height = 45
	else:
		sprite.frame = 0

func _ready():
	pass
	#animation.play("Run")

func _physics_process(delta):
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jump_height
		gravity = 40
	if Input.is_action_just_released("jump"):
		gravity = 80
	
	if velocity.y == 0 and is_on_floor():
		gravity = Global.init_gravity
		
	
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)

func player_hit():
	emit_signal("hit")
	queue_free()
