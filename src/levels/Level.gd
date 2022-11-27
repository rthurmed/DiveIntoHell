extends YSort


export var next_scene: PackedScene
export var path_door_exit: NodePath
export var path_player: NodePath

onready var door_exit = get_node(path_door_exit)
onready var player = get_node(path_player)
onready var animation = $AnimationPlayer

var remaining_enemies = 0


func _ready():
	var enemies = get_tree().get_nodes_in_group('enemy')
	remaining_enemies = len(enemies)
	for enemy in enemies:
		var _ok = enemy.connect('death', self, '_on_Enemy_death')
	
	player.connect('death', self, '_on_Player_death')


func _process(_delta):
	if Input.is_action_just_released("cheat_next_level"):
		go_to_next()


func open_exit_door():
	door_exit.set_opened(true)


func go_to_next():
	if not next_scene: return
	var _ok = get_tree().change_scene_to(next_scene)


func reset_scene():
	var _ok = get_tree().reload_current_scene()


func _on_Enemy_death():
	remaining_enemies -= 1
	if remaining_enemies <= 0:
		animation.play("gamewin")


func _on_Player_death():
	animation.play("gameover")
