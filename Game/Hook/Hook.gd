extends Node2D

var unHook = true

func _physics_process(_delta):
	if unHook:
		$Sprite2.z_index = 0
	else:
		$Sprite2.z_index = 10
	if not unHook && Input.is_action_just_pressed("ui_select"):
		unHook = true

func _on_Area_body_entered(body):
	body.hooked = true
	var tween = get_node("Tween")
	SoundManager.play_sound("CANDADO_ENGANCHE")
	tween.interpolate_property(body, "position",
		Vector2(body.position.x, body.position.y), Vector2( self.position.x, self.position.y + 38), 0.2,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	unHook = false
	tween.start()
