extends Control


const FRAME_FULL = 0
const FRAME_BROKEN = 1


func set_value(value):
	$Sprite.frame = FRAME_FULL if value else FRAME_BROKEN
