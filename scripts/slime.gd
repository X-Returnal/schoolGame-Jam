extends CharacterBody2D

var speed = 150  # speed in pixels/sec
var health = 2.5
func _ready():
	add_to_group("mobs")
func _physics_process(delta):
	if health <0.01:
		get_tree().queue_delete(self)
	
	var direction = (get_closest_player().position-position).clamp(Vector2(-1,-1),Vector2(1,1))
	look_at(get_closest_player().position)
	velocity = direction * speed
	move_and_slide()
func get_closest_player():
	var players = get_tree().get_nodes_in_group("player")
	var nearest_player = players[0]

	# look through spawn nodes to see if any are closer
	for player in players:
		if player.global_position.distance_to(global_position) < nearest_player.global_position.distance_to(global_position):
			nearest_player = player
	return nearest_player
func damage(amount):
	health -= amount
