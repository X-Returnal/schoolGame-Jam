extends CharacterBody2D
@export var Bullet : PackedScene

func _ready():
	add_to_group("player")
var speed = 400  # speed in pixels/sec

func _physics_process(delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	look_at(get_global_mouse_position())
	velocity = direction * speed
	if Input.is_action_just_pressed("click"):
		shoot()
	move_and_slide()
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Marker2D.global_transform
