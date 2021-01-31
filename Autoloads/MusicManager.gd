extends Node

var current_music : AudioStreamPlayer

enum Music {
	NIVEL_1,
	NIVEL_2,
	NIVEL_3,
	NIVEL_4
}
var music

func play(music_enum):
	if music_enum == music:
		return
	
	music = music_enum
	
	if current_music: current_music.stop()
	
	match music_enum:
		Music.NIVEL_1: current_music = $Nivel_1
		Music.NIVEL_2: current_music = $Nivel_2
		Music.NIVEL_3: current_music = $Nivel_3
		Music.NIVEL_4: current_music = $Nivel_4
	
	current_music.play()
