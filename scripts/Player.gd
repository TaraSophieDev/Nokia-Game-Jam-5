extends KinematicBody2D

var health: int = 1
var velocity = Vector2.ZERO

export var jump_height = 35.0
export var gravity = 50.0

#onready var animation = $AnimatedSprite

func _ready():
	pass
	#animation.play("Run")

func _physics_process(delta):
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jump_height
	
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)

func player_hit():
	health -= 1
	if health == 0:
		queue_free()
