extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/test_map.tscn")


func _on_exit_body_entered(body):
	get_tree().quit()


func _on_options_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_chr_select_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/charactor_select.tscn")


func _on_back_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
