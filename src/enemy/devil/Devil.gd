extends KinematicBody2D
class_name Devil


const AIM_SPEED = 1.5
const AIM_OFFSET = Vector2.UP * 16 # tweak to point to the center of the player

export var path_target: NodePath

onready var original_target = get_node_or_null(path_target)
onready var target = get_node_or_null(path_target)
onready var visual_instance = $VisualInstance
onready var upper_vi = $VisualInstance/Upper
onready var animation = $AnimationPlayer
onready var aim_raycast = $VisualInstance/Upper/AimRayCast
onready var aim_visual = $VisualInstance/Upper/AimRayCast/VisualRay
onready var state_machine = $StateMachine

# warning-ignore:unused_signal
signal shoot
# warning-ignore:unused_signal
signal death

# TODO: Enemy base class with common functions


func aim_to_target(delta, speed = AIM_SPEED, offset = AIM_OFFSET):
	if not is_instance_valid(target): return
	var angle = upper_vi.global_position.angle_to_point(target.global_position + offset)
	upper_vi.rotation = lerp_angle(upper_vi.rotation, angle, delta * speed)


func update_visual_aim():
	var length = aim_raycast.global_position.distance_to(aim_raycast.get_collision_point())
	length = length * -1
	aim_visual.polygon[2].x = length
	aim_visual.polygon[3].x = length


func damage():
	state_machine.transition('Death')
