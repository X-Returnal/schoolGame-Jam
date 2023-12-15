extends CharacterBody2D
@export var Bullet : PackedScene

func _ready():
	add_to_group("player")
	randomize()
	

var health = 3

var speed = 400  # speed in pixels/sec
@export
var progress_speed:float = 250
var bullet_spread:float = 0.1
var refire:bool = false
var progress:float = 101
@export
var reset_progress = 185
var invultime:int = 120
func _physics_process(delta):
	invultime -= 1
	var direction = Input.get_vector("left", "right", "up", "down") *30
	look_at(get_global_mouse_position())
	velocity = direction * speed * delta
	if health <0.01:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	if !Input.is_action_pressed("click"):
		progress = reset_progress
		refire = false
	if Input.is_action_pressed("click"):
		progress += progress_speed*delta
		if progress > 100:
			
			shoot()
			refire = true
			progress = 0
	move_and_slide()
func shoot():
	
	var b = Bullet.instantiate()
	b.bullet_team = 1
	
	owner.add_child(b)
	var deviation_angle = PI * bullet_spread
	b.transform = $source.global_transform
	if refire:
	
		b.rotation += randf_range(-deviation_angle, deviation_angle)

func damage(amount):
	if invultime > 0:
		return false
	else:
		health -= amount
		invultime = 120
		return true
