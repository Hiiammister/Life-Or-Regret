extends Area2D


var entered=false



func _on_Area2D_body_entered(body):
	entered=true


func _on_Area2D_body_exited(body):
	entered=false
	
func _process(delta):
	if entered==true:
		if Input.is_action_just_pressed("left"):
			get_tree().change_scene_to_file("res://main.tscn")
