extends Node2D

@export
#makes bullet go fast
var bullet_speed:int = 750
@export
#makes that guy go ow
var bullet_damage:int = 1
@export 
#prevents loss of bullet damage
var bullet_pierce:int = 0
@export
#set bullet's collison -1: bad 0: neutrial (dmg all) 1: player 1 2: player 2
var bullet_team:int = 0

func _physics_process(delta):
	# move dat thang
	position += transform.x * bullet_speed * delta


func _on_area_2d_body_entered(body):
	if body.is_in_group("mobs"):
		if bullet_team != -1 or global.friendlyfire > 1:
			body.damage(bullet_damage)
			if bullet_pierce > 0:
				bullet_pierce -= 1
			else:
				bullet_damage -= body.health
	if body.is_in_group("player1"):
		#check alignments
		if bullet_team < 1 or global.friendlyfire > 0:
			body.damage(bullet_damage)
			if bullet_pierce > 0:
				bullet_pierce -= 1
			else:
				bullet_damage -= body.health
		
	if body.is_in_group("walls"):
		queue_free()
