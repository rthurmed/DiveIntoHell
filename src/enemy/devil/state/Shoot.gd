extends State


export var arrow: PackedScene

onready var aim_raycast: RayCast2D = $"%AimRayCast"
onready var arrow_spawn: Position2D = $"%ArrowSpawnPosition"


func enter():
	var instance = arrow.instance()
	
	instance.global_position = arrow_spawn.global_position
	instance.global_rotation = aim_raycast.global_rotation
	
	owner.get_parent().add_child(instance)
	
	owner.target = instance # focus on the arrow before aiming again
	owner.animation.play('RESET')
	
	transition('Wait')
