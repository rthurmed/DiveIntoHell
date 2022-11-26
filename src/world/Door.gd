extends Node2D


const FRAME_CLOSED = 0
const FRAME_OPENED = 1

export var opened = false

onready var sprite = $Sprite


func _ready():
	set_opened(opened)


func set_opened(value: bool):
	opened = value
	sprite.frame = FRAME_OPENED if value else FRAME_CLOSED



