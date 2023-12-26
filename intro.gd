extends Node

func _ready():
	$AnimationPlayer.play("fade in")
	await(get_tree().create_timer(6).timeout)
	$AnimationPlayer.play("fad eout")
	await(get_tree().create_timer(6).timeout)
	get_tree().change_scene_to_file("res://mainmenu.tscn")
	
	
	
