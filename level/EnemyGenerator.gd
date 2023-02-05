extends Path2D

var rng = RandomNumberGenerator.new()
var rng2 = RandomNumberGenerator.new()
var rng3 = RandomNumberGenerator.new()
var rng4 = RandomNumberGenerator.new()
onready var enemy = preload("res://enemys/enemy1/enemy1.tscn")

onready var ressourceArray = [
	preload("res://resources/earth/earth.tscn"),
	preload("res://resources/water/water.tscn"),
	preload("res://resources/light/light.tscn")
]



# Called when the node enters the scene tree for the first time.
func _ready():
	$RessourcesTimer.connect("timeout", self, "generate_ressource")
	rng.randomize()
	rng2.randomize()
	rng3.randomize()
	rng4.randomize()


func generate_enemy():
	$PathFollow2D.unit_offset = rng.randf_range(0.0, 1.0)
	print($PathFollow2D.global_position)
	# Called every frame. 'delta' is the elapsed time since the previous frame.
	var newenemy: Node2D = enemy.instance()
	newenemy.position = $PathFollow2D.global_position
	print("instanced")
	get_tree().root.add_child(newenemy)
	print("add_child")
	#owner.add_child(newenemy)
	

func generate_ressource():
	if get_node("%Tree").move_direction != Vector2(0,0):
		$PathFollow2D.unit_offset = rng2.randf_range(0.0, 1.0)
		var newressource = ressourceArray[rng3.randi_range(0,2)].instance()
		newressource.position = $PathFollow2D.global_position
		get_tree().root.add_child(newressource)


func _on_Timer_timeout():
	generate_enemy()
	pass # Replace with function body.
