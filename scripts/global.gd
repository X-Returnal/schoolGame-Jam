extends Node
@export
var friendlyfire = -1
@export
var current_score = 0
@export
var current_time = -1

var on_run = false

func _process(_delta):
	if on_run:
		if current_time < 0:
			end_run()
		current_time -= 1
func start_run():
	current_score = 0
	current_time = 50000
	get_tree().change_scene_to_file("res://scenes/test_map.tscn")
func end_run():
	#TODO: save scores and score desplay
	on_run = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
