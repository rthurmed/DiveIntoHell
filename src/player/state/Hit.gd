extends State


export var life_indicator: PackedScene

onready var container_life = $"%ContainerLife"
onready var sound_hit = $"../../Sound/Hit"

func _ready():
	# create UI
	for _idx in range(0, owner.life_max):
		container_life.add_child(life_indicator.instance())


func handle_input(_event: InputEvent): pass
func process(_delta: float): pass
func physics_process(_delta: float): pass


func enter():
	# update UI
	for child_idx in container_life.get_child_count():
		var active = child_idx < owner.life
		container_life.get_child(child_idx).set_value(active)
	
	if owner.life <= 0:
		transition('Death')
		return
	
	sound_hit.play()
	# TODO: animation?
	transition('Walk')


func exit(): pass
