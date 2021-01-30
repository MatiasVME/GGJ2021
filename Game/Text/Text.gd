extends Node2D

export (String) var the_text


func _ready():
	$Label.text = the_text
	$Label.modulate.a = 0


func _on_DetectArea_body_entered(body):
#	if body is Player:
	$Anim.play("Show")


func _on_DetectArea_body_exited(body):
#	if body is Player:
	$Anim.play_backwards("Show")
