extends Node2D


func _ready():
	$Respawn.set_player($Player)
	MusicManager.play(MusicManager.Music.NIVEL_1)

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
