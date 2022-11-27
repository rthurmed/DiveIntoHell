extends Node


func timer_percent(timer: Timer):
	return timer.time_left / timer.wait_time
