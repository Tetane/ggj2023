extends Path2D

var rng = RandomNumberGenerator.new()
onready var enemy = preload("res://enemys/enemy1/enemy1.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	pass # Replace with function body.

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
	
#func _process(delta):
#	pass


func _on_Timer_timeout():
	generate_enemy()
	pass # Replace with function body.
