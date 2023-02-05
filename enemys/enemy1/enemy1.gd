extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var SPEED = 20;
export var LIFE = 2;
export var POWER = 1;


# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func take_dommage(val):
	$AnimationPlayer.play("takeDamage")
	LIFE -= val
	if LIFE <= 0:
		queue_free()

func _physics_process(delta):
	
	# check if game over
	if Autoload.game_over:
		queue_free()
		
	
	var direction = Vector2()
	
	direction =  Autoload.player_position - global_position
	
	look_at(Autoload.player_position)


	scale.y = sign(direction.x)
		
	
	direction = direction.normalized() * SPEED
	move_and_slide(direction)

	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "Tree":
			collision.collider.take_damage(POWER)
			
