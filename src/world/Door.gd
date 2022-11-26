extends Node2D


const OFFSET_X_CLOSED = 0
const OFFSET_X_OPENED = 64

export var opened = false

onready var sprite = $Sprite


func _ready():
	set_opened(opened)


func set_opened(value: bool):
	opened = value
	sprite.region_rect.position.x = OFFSET_X_OPENED if value else OFFSET_X_CLOSED



