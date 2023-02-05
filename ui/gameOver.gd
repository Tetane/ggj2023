extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("%RetryButton").connect("pressed", self, "_on_retry")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_retry():
	Autoload.game_over=false
	get_tree().reload_current_scene()
