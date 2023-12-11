extends CharacterBody2D
@export
var speed:float = 150  # speed in pixels/sec

@export
var health:float = 2.5 # how much damage can be taken before being sent to the shadow realm

@export
var mob_value:int = 0

var has_weapon = false # do they have projectiles


var projectile_type


func _ready():
	add_to_group("mobs")
	
func _physics_process(_delta):
	if health <0.01:
		queue_free()
	
	var direction = (get_closest_player().position-position).clamp(Vector2(-1,-1),Vector2(1,1))
	look_at(get_closest_player().position)
	velocity = direction * speed
	move_and_slide()
	
	
	
	
	
func get_closest_player():
	var players = get_tree().get_nodes_in_group("player")
	#assume first player is closest
	var nearest_player = players[0]

	# look through player to see if any are closer
	for player in players:
		if player.global_position.distance_to(global_position) < nearest_player.global_position.distance_to(global_position):
			nearest_player = player
	return nearest_player
	
	
func damage(amount):
	health -= amount
