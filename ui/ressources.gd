extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_water(100);
	set_earth(100);
	set_light(100);
	set_life(100);
	pass # Replace with function body.

func set_water(newval):
	get_node("%WaterProgressBar").value = newval
	
func set_earth(newval):
	get_node("%EarthProgressBar").value = newval
	
func set_light(newval):
	get_node("%LightProgressBar").value = newval
	
func set_life(newval):
	get_node("%LifeProgressBar").value = newval
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_xp(xp):
	get_node("%XPProgressBar").value = xp

func set_max_xp(maxxp):
	get_node("%XPProgressBar").max_value = maxxp

func set_level(level):
	get_node("MarginContainer/VBoxContainer/XPBox/Label").text = "Lvl "+str(level)

func get_max_xp():
	return get_node("%XPProgressBar").max_value
	

