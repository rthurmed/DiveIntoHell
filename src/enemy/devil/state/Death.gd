extends State


const ANIMATION_NAME = 'death'


func handle_input(_event: InputEvent): pass
func process(_delta: float): pass
func physics_process(_delta: float): pass


func enter():
	owner.animation.play(ANIMATION_NAME)


func _on_AnimationPlayer_animation_finished(anim_name):
	if not active() or not anim_name == ANIMATION_NAME:
		return
	owner.queue_free()
