extends Control
@onready var audio_stream_player = $AudioStreamPlayer

func _process(_delta):
	get_tree().paused = false

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")

func _on_question_pressed():
	get_tree().change_scene_to_file("res://scenes/what_do.tscn")

func _on_hidden_button_pressed():
	get_tree().change_scene_to_file("res://scenes/secret.tscn")

func _on_back_to_menu_pressed():
	$whatdoLayer.visible = false

func _on_questionedtwo_pressed():
	print("button clicked")
	$whatdoLayer.visible = true
	print("layer should be visible??")
