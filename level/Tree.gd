extends KinematicBody2D


onready var weapon1 = preload("res://weapons/weapon1/weapon1.tscn")

var move_direction := Vector2(0,0)
var SPEED := 5
onready var init_position := position

# Called when the node enters the scene tree for the first time.
func _ready():
	$WeaponTimer.connect("timeout", self, "_shoot")


func _shoot():
	var bulletInstance: Node2D = weapon1.instance()
	bulletInstance.global_position = global_position
#	get_tree().root.add_child(bulletInstance)
	owner.add_child(bulletInstance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass

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
	if move_direction != Vector2(0,0):
		$Sprite.material.set_shader_param("running", 1)
	else:
		$Sprite.material.set_shader_param("running", 0)
		
	$GrassMap.material.set_shader_param("playerMove", (position - init_position))
	
	# update position for enemys
	Autoload.player_position = global_position
