extends Control
@onready var audio_stream_player = $AudioStreamPlayer

@onready var ss_1 = $SS1

func _ready():
	get_tree().paused = false
