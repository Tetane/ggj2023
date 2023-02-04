extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var move_direction := Vector2(0,0)
var SPEED := 5
onready var init_position := position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	move_direction = Vector2(0, 0)
	
	if Input.is_action_pressed("move_down"):
		move_direction.y = 1
	if Input.is_action_pressed("move_up"):
		move_direction.y = -1
	if Input.is_action_pressed("move_left"):
		move_direction.x = -1
	if Input.is_action_pressed("move_right"):
		move_direction.x = 1
	
	move_and_collide(move_direction.normalized() * SPEED)
#	get_node("%GrassMap").get_material(0).set_shader_param("playerMove", move_direction.normalized() * SPEED)

	$GrassMap.material.set_shader_param("playerMove", (position - init_position))