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
	var player = get_node("%Tree")
	direction =  player.global_position - global_position
	
	look_at(player.global_position)

	$Icon.flip_v = direction.x < 0
		
	
	direction = direction.normalized() * SPEED
	move_and_slide(direction)
	pass
