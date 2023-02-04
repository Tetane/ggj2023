extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var SPEED = 20;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(delta):
	var direction = Vector2()
	var player = get_node("%Tree")
	direction =  player.global_position - global_position
	
	
	direction = direction.normalized() * SPEED
	move_and_slide(direction)
	pass
