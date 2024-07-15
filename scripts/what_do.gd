extends Control
@onready var ovatrulant = $ovatrulant
@onready var blothing = $Blothing
@onready var taknith = $Taknith
@onready var pageturning = $pageturning
@onready var main_music = $MainMusic

func _ready():
	ovatrulant.visible = true
	blothing.visible = false
	taknith.visible = false


func _on_next_page_pressed():
	pageturning.playing = true
	blothing.visible = true
	ovatrulant.visible = false


func _on_next_page_2_pressed():
	pageturning.playing = true
	taknith.visible = true
	blothing.visible = false


func _on_back_button_pressed():
	pageturning.playing = true
	ovatrulant.visible = true
	blothing.visible = false

func _on_back_button_2_pressed():
	pageturning.playing = true
	blothing.visible = true
	taknith.visible = false


func _on_back_up_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
