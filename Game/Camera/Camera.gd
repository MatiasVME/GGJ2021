extends Camera2D


func _ready():
	update_cam_limits()
	
	
func update_cam_limits():
	limit_left = $Pos1.global_position.x
	limit_top = $Pos1.global_position.y
	
	limit_right = $Pos2.global_position.x
	limit_bottom = $Pos2.global_position.y
