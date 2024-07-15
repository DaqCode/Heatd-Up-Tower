extends CharacterBody2D
@onready var turret = $"/root/MainGame/GameProperties/turret"

var speed = 65
var enemyVelocity = Vector2()
var counter = 2

func _physics_process(delta):
	var goPlayer = (turret.global_position - global_position).normalized()
	enemyVelocity = goPlayer * speed
	move_and_collide(enemyVelocity * delta)

func kill_enemy():
	queue_free()

func _on_taknith_area_area_entered(area):
	if counter == 0:
		kill_enemy()
	if area.name == "turretArea":
		#print("enemy died from being touched")
		kill_enemy()
	elif area.name == "bulletArea":
		counter -=1
