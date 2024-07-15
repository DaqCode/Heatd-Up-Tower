extends Node

@onready var label = $Label
@onready var countdown = $countdown

func _ready():
	countdown.start()
	
func timerLeft():
	var remaining_time = countdown.time_left
	var minute = floor(remaining_time / 60)
	var second = int(remaining_time) % 60
	return [minute, second]

func _process(_delta):
	label.text = "%02d:%02d" % timerLeft()
