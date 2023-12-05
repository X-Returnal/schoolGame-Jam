extends Node2D

@export
#makes bullet go fast
var bullet_speed:int = 750
@export
#makes that guy go ow
var bullet_damage:int = 1
@export 
#prevents loss of damage
var bullet_pierce:int = 0
@export
#set bullet's collison -1: bad 0: neutrial (dmg all) 1: good
var bullet_team:int = 0

func _physics_process(delta):
	position += transform.x * bullet_speed * delta


func _on_area_2d_body_entered(body):
	if body.is_in_group("mobs"):
		
		body.damage(bullet_damage)
		if bullet_pierce > 0:
			bullet_pierce -= 1
		bullet_damage -= body.health
		
	if body.is_in_group("walls"):
		queue_free()
