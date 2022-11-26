extends State


func enter():
	print(owner.name, ' shoots an arrow')
	
	# TODO: spawn arrow as simbling to the enemy
	# TODO: set arrow as target
	
	owner.animation.play('RESET')
	transition('Wait')
