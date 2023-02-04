extends KinematicBody2D


onready var weapon1 = preload("res://weapons/weapon1/weapon1.tscn")

var move_direction := Vector2(0,0)
var SPEED := 5
onready var init_position := position

signal water_change(newval)
signal earth_change(newval)
signal light_change(newval)

var water = 100 setget set_water 
var earth = 100 setget set_earth
var light = 100 setget set_light

func set_water(val):
	water = val
	emit_signal("water_change", water)

func set_earth(val):
	earth = val
	emit_signal("earth_change", earth)
	
func set_light(val):
	light = val
	emit_signal("light_change", light)	

func decrease_water():
	water -= 1
	emit_signal("water_change", water)

func decrease_earth():
	earth  -= 1
	emit_signal("earth_change", earth)
	
func decrease_light():
	light -= 1
	emit_signal("light_change", light)	

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
