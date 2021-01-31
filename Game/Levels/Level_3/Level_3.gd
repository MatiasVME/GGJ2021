extends Node2D


func _on_AnimZoom_body_entered(body):
	$Player/Camera/Pos1.global_position = $NewPos/Pos1.global_position
	$Player/Camera/Pos2.global_position = $NewPos/Pos2.global_position
	
	yield(get_tree().create_timer(3.0), "timeout")
	$Text2.hide()
	
	$Player/Camera.update_cam_limits()
	
	$AnimZoom/Anim.play("ZoomPlay")
