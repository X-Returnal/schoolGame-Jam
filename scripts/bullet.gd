extends Node2D

@export
#makes bullet go fast
var bullet_speed:int = 750
@export
var bullet_damage:int = 1
#makes that guy go ow
@export 
var bullet_pierce:int = 0
#prevents loss of bullet damage
@export
var bullet_team:int = 0
#set bullet's collison -1: bad 0: neutrial (dmg all) 1: player 1 2: player 2

@export 
var bullet_sprite:CompressedTexture2D
var bullet = Sprite2D.new()
func _ready():
	add_child(bullet, true)
	bullet.texture = bullet_sprite

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
			if bullet_damage <0:
				queue_free()
	if body.is_in_group("player1"):
		#check alignments
		if bullet_team < 1 or global.friendlyfire > 0:
			body.damage(bullet_damage)
			if bullet_pierce > 0:
				bullet_pierce -= 1
			else:
				bullet_damage -= body.health
			if bullet_damage <0:
				queue_free()
	if body.is_in_group("walls"):
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
