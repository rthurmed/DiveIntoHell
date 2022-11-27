extends Node2D


onready var animation = $AnimationPlayer


func _on_EndingArea2D_body_entered(_body):
	animation.play("animation")
