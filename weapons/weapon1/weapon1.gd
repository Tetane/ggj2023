extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var SPEED = 500
onready var spawnPosition = global_position
onready var mouseSpawnPosition = get_global_mouse_position()


# Called when the node enters the scene tree for the first time.
func _ready():
	$DeleteTimer.connect("timeout", self, "delete")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var direction = Vector2(0,0)
	direction = mouseSpawnPosition - spawnPosition
	global_position = global_position + direction.normalized() * SPEED * delta
	


func delete():
	queue_free()


func _on_Area2D_body_entered(body):
	print("pomme touche", body)
	body.queue_free()
	queue_free()
	pass # Replace with function body.
