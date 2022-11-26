extends State


func process(delta: float):
	owner.apply_movement(delta, owner.capture_movement_input())


func exit():
	owner.movement = Vector2.ZERO
