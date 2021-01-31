extends Node2D

func _on_Area_body_entered(body):
	body.hooked = true
	var tween = get_node("Tween")
	SoundManager.play_sound("CANDADO_ENGANCHE")
	tween.interpolate_property(body, "position",
		Vector2(body.position.x, body.position.y), Vector2( self.position.x, self.position.y + 20), 0.2,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

