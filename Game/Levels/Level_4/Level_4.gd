extends Node2D

func _ready():
	$Respawn.set_player($Player)
	MusicManager.play(MusicManager.Music.NIVEL_3)
