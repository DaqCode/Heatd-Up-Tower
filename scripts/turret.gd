extends CharacterBody2D
@onready var marker_2d = $Marker/Marker2D
@onready var marker = $Marker
@onready var barrel_rotation = $BarrelRotation
@onready var shooting_cool = $ShootingCool
@onready var shooting_sound = $shootingSound

const bullet_path = preload("res://scenes/bullet.tscn")
var shootCool := true

func _process(_delta):
	if shootCool:
		if Input.is_action_pressed("shoot"):
			shooting_sound.playing = true
			shoot()
			#print("You shot a bullet!")
			shootCool = false
			shooting_cool.start()
		
	marker.look_at(get_global_mouse_position())
	
func _physics_process(_delta):
	barrel_rotation.look_at(get_global_mouse_position())
	
func shoot():
	var bullet = bullet_path.instantiate()
	get_parent().add_child(bullet)
	bullet.position = marker_2d.global_position
	bullet.velocity = get_global_mouse_position() - bullet.position
	bullet.look_at(get_global_mouse_position())

func _on_shooting_cool_timeout():
	#print("Coooldown nonactive, return fire!")
	shootCool = true
