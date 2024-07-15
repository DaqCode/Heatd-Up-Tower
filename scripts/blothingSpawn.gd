extends Node2D

const width = 70
const height = 900

var spawnArea = Rect2()

@onready var spawn_time = $spawnTime

const ENEMIES = preload("res://scenes/enemies.tscn")

var deltaTime = 2.5
var offset = 0.75

func _ready():
	randomize()
	spawnArea = Rect2(0,0,width, height)
	set_time()

func spawn_enemy():
	var blothing_position = Vector2(randi()%width, randi()%height)
	
	var enemy 	= ENEMIES.instantiate()
	enemy.position = blothing_position
	add_child(enemy)
	return blothing_position
	
func set_time():
	var nextTime = deltaTime * (randf()-0.5)*2.0*offset
	spawn_time.wait_time = nextTime
	spawn_time.start()

func _on_spawn_time_timeout():
	spawn_enemy()
	set_time()
