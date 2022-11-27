extends ProgressBar


onready var timer: Timer = $"%DashRecoveryTimer"


func _process(_delta):
	value = Util.timer_percent(timer) * 100
