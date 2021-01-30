extends Position2D

var player


func set_player(_player):
	player = _player


func _process(delta):
	if not player:
		return
		
	if player.global_position.y >= 720:
		player.global_position = global_position
