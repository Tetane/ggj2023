extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var SPEED = 20;
export var LIFE = 2;



# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func take_dommage(val):
	LIFE -= val
	if LIFE <= 0:
		queue_free()

func _physics_process(delta):
	var direction = Vector2()
	
	direction =  Autoload.player_position - global_position
	
	look_at(Autoload.player_position)


	scale.y = sign(direction.x)
		
	
	direction = direction.normalized() * SPEED
	move_and_slide(direction)
