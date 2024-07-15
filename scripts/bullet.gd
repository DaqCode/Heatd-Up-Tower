extends CharacterBody2D
@onready var despawn = $despawn

var speed := 1250

func _ready():
	despawn.start()
	
func _physics_process(delta):
	var collision_data = move_and_collide(velocity.normalized() * delta * speed)

func _on_despawn_timeout():
	#print("Bullets despawned")
	queue_free()
	
func kill_bullet():
	call_deferred("free")

func _on_bullet_area_area_entered(area):
	if area.name == "enemyArea":
		#print("bullet despawned from collision of enemy")
		kill_bullet()
	if area.name == "taknithArea":
		#print("bullet despawned from collision of enemy")
		kill_bullet()
	if area.name == "ovatrulantArea":
		#print("bullet despawned from collision of enemy")
		kill_bullet()
