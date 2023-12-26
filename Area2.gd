extends Area2D



var entered=false
func _on_Area2_body_entered(body):
	entered=true
	


func _on_Area2_body_exited(body):
	if entered==true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://world3.tscn")
