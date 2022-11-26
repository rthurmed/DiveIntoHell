extends Area2D
class_name Devil


const AIM_SPEED = 1.5
const AIM_OFFSET = Vector2.UP * 16 # tweak to point to the center of the player

export var path_target: NodePath

onready var original_target = get_node_or_null(path_target)
onready var target = get_node_or_null(path_target)
onready var visual_instance = $VisualInstance
onready var upper_vi = $VisualInstance/Upper
onready var animation = $AnimationPlayer

# TODO: Enemy base class with common functions
# TODO: arrow mechanics
# TODO: sprite that look more 'topdown-ish'


func aim_to_target(delta, speed = AIM_SPEED, offset = AIM_OFFSET):
	var angle = upper_vi.global_position.angle_to_point(target.global_position + offset)
	upper_vi.rotation = lerp_angle(upper_vi.rotation, angle, delta * speed)


func _on_StateMachine_transition(state_name):
	print(name, ' transitions to state[', state_name, ']')
