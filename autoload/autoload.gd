extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_position : Vector2 = Vector2() 
var game_over = false
var totalxp = 0
var currentxp = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func player_died():
	game_over = true
	get_node("../MainNode/CanvasLayer/GameOver").visible = true

func gain_xp(xp):
	currentxp += xp
	get_node("../MainNode/CanvasLayer/Control2/Control").set_xp(currentxp)
	var m = get_node("../MainNode/CanvasLayer/Control2/Control").get_max_xp()
	if currentxp >= m:
		totalxp += currentxp
		currentxp = 0
		get_node("../MainNode/CanvasLayer/Control2/Control").set_xp(currentxp)
		get_node("../MainNode/CanvasLayer/Control2/Control").set_max_xp(m*2)
		get_node("../MainNode/Node2D/Tree").level_up(1)
