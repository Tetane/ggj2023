extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String, "water", "light", "earth") var type
export var quantity = 100;
var tree=null

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("body_entered",self,"tree_entered")
	$Area2D.connect("body_exited",self,"tree_exited")
	

	pass # Replace with function body.



	
func take(val):
	quantity -= val
	if quantity <= 0:
		queue_free()

func tree_entered(body):
	print(body)
	tree = body
	pass
	
func tree_exited(body):
	tree = null
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if tree != null:
		tree.recolte(self,delta)
	
	# destruct if collide with other ressources
	if not $Area2D.get_overlapping_areas().empty():
		queue_free()
	
func _physics_process(delta):
	# check if game over
	if Autoload.game_over:
		queue_free()
		
