extends CharacterBody2D


func _physics_process(delta):
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D.flip_h=true
	
func npcM1():
	pass
