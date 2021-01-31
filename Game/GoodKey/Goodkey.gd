extends Node2D


func _on_Anim_animation_finished(anim_name):
	queue_free()
	
	
func _on_Area_body_entered(body):
	if body is Player:
		$Anim.play("Take")
