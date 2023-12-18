extends Node
@export
var friendlyfire = -1
@export
var current_score = 0
@export
var current_time = -1
var level_score = 0
var cleared_floors = 0
var on_run = false

var gameover = preload("res://scenes/end_screen.tscn")

func _process(_delta):
	if on_run:
		if current_time < 0:
			end_run()
		current_time -= 1
func start_run():
	current_score = 0
	current_time = 30000
	cleared_floors = 0
	on_run = true
	get_tree().change_scene_to_file("res://scenes/lvl_0.tscn")
func end_run():
	on_run = false
	get_tree().change_scene_to_packed(gameover)
