extends Node2D


func _ready():
	pass


func _on_Area_body_entered(body):
	if body is Player:
		$Anim.play("Angry")
		SoundManager.play_sound("CANDADO_INCORRECTO")
