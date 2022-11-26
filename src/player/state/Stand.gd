extends State


func process(delta: float):
	var movement: Vector2 = owner.capture_movement_input()
	if not movement.is_equal_approx(Vector2.ZERO):
		transition('Walk')
	owner.apply_movement(delta, Vector2.ZERO)
