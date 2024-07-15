extends Node2D
@onready var timer = $Timer
@onready var loss_screen = $"Loss Screen"

@onready var heart_1 = $Heart1
@onready var heart_2 = $Heart2
@onready var heart_3 = $Heart3
@onready var win_screen = $WinScreen
@onready var pausecanvas = $pausecanvas
@onready var audio_stream_player = $AudioStreamPlayer
@onready var audio_stream_player_2 = $AudioStreamPlayer2

var health = 3

func _ready():
	get_tree().paused = false
	heart_1.visible = true
	heart_2.visible = true
	heart_3.visible = true
	loss_screen.visible = false
	win_screen.visible = false
	timer.start()

func _on_timer_timeout():
	win_screen.visible = true
	get_tree().paused = true

func _process(_delta):
	if health == 0:
		loss_screen.visible = true
		get_tree().paused = true
	if Input.is_action_just_pressed("pause"):
		pausecanvas.visible = true
		get_tree().paused = true

func _on_game_checker_area_area_entered(area):
	if area.name == "enemyArea" or area.name == "taknithArea" or area.name =="ovatrulantArea":
		if health == 3:
			heart_3.visible = false
			audio_stream_player_2.playing = true
			health -= 1
		elif health == 2:
			heart_2.visible = false
			audio_stream_player_2.playing = true
			health -= 1
		elif health == 1:
			audio_stream_player_2.playing = true
			heart_1.visible = false
			health -= 1

func _on_retry_pressed():
	get_tree().reload_current_scene()
	
func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func _on_win_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_un_stop_time_pressed():
	pausecanvas.visible = false
	get_tree().paused = false

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
