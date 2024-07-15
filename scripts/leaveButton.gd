extends Button


func _on_pressed():
	print("CLICKED")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
