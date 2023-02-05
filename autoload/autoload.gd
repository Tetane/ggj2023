extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_position : Vector2 = Vector2() 
var game_over = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func player_died():
	game_over = true
	get_node("../MainNode/CanvasLayer/GameOver").visible = true

