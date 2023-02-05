extends KinematicBody2D
var rng = RandomNumberGenerator.new()

onready var weapon1 = preload("res://weapons/weapon1/weapon1.tscn")
onready var musicarray = [ preload("res://soundeffects/plop/plop1.mp3"),
 preload("res://soundeffects/plop/plop2.mp3"),
 preload("res://soundeffects/plop/plop3.mp3"),
 preload("res://soundeffects/plop/plop3.mp3"),
 preload("res://soundeffects/plop/plop4.mp3"),
 preload("res://soundeffects/plop/plop5.mp3"),
 preload("res://soundeffects/plop/plop6.mp3"),
 preload("res://soundeffects/plop/plop7.mp3"),
 preload("res://soundeffects/plop/plop8.mp3"),
 preload("res://soundeffects/plop/plop9.mp3"),
 preload("res://soundeffects/plop/plop10.mp3"),
 preload("res://soundeffects/plop/plop11.mp3"),
 preload("res://soundeffects/plop/plop12.mp3")
]
var move_direction := Vector2(0,0)
var SPEED := 5
onready var init_position := position

signal water_change(newval)
signal earth_change(newval)
signal light_change(newval)
signal life_change(newval);

var water = 100 setget set_water 
var earth = 100 setget set_earth
var light = 100 setget set_light
var life = 100 setget set_life

export var speed_take = 0.1 # vitesse a laquelle on pompe une ressource

func set_water(val):
	water = val
	emit_signal("water_change", water)

func set_earth(val):
	earth = val
	emit_signal("earth_change", earth)
	
func set_light(val):
	light = val
	emit_signal("light_change", light)	

func set_life(val):
	life = val
	emit_signal("life_change", life)	

func decrease_water():
	water -= 1
	emit_signal("water_change", water)

func decrease_earth():
	earth  -= 1
	emit_signal("earth_change", earth)
	
func decrease_light():
	light -= 1
	emit_signal("light_change", light)	

func decrease_life(dmg):
	life -= dmg
	emit_signal("life_change", life)	


# Called when the node enters the scene tree for the first time.
func _ready():
	$WeaponTimer.connect("timeout", self, "_shoot")


func _shoot():
	var bulletInstance: Node2D = weapon1.instance()
	bulletInstance.global_position = global_position
#	get_tree().root.add_child(bulletInstance)
	owner.add_child(bulletInstance)
	
	$WeaponAudio.stream = musicarray[rng.randi_range(0,11)]
	$WeaponAudio.play()

func take_damage(val):
	set_life(life - val)

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
		$Sprite.material.set_shader_param("running", 1.0)
		$Sprite.material.set_shader_param("pumping", 0.0)
	else:
		$Sprite.material.set_shader_param("running", 0.0)
		
	$GrassMap.material.set_shader_param("playerMove", (position - init_position))
	
	# update position for enemys
	Autoload.player_position = global_position


func recolte(ressource,delta):

	# si arbre immobile
	if move_direction == Vector2(0,0):
		var amount = speed_take * delta
		if ressource.type == "water" and water < 100:
			ressource.take(amount)
			set_water(water + amount)
			$Sprite.material.set_shader_param("pumping", 1.0)
		if ressource.type == "earth" and earth < 100:
			ressource.take(amount)
			set_earth(earth + amount)
			$Sprite.material.set_shader_param("pumping", 1.0)
		if ressource.type == "light" and light < 100:
			ressource.take(amount)
			set_light(light + amount)
			$Sprite.material.set_shader_param("pumping", 1.0)
	else:
		$Sprite.material.set_shader_param("pumping", 0.0)
