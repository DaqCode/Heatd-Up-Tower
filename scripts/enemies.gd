extends CharacterBody2D
@onready var turret = $"/root/MainGame/GameProperties/turret"

var speed = 100
var enemyVelocity = Vector2()
var counter = 1


func _physics_process(delta):
	var goPlayer = (turret.global_position - global_position).normalized()
	enemyVelocity = goPlayer * speed
	move_and_collide(enemyVelocity * delta)

func kill_enemy():
	queue_free()
	
func _on_area_2d_area_entered(area):
	if counter == 0:
		kill_enemy()
	if area.name == "turretArea":
		#print("enemy died from being touched")
		kill_enemy()
	elif area.name == "bulletArea":
		#print("Enemy died by shot")
		counter -= 1
		
