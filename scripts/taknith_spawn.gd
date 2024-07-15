extends Node2D

const width = 70
const height = 900

var spawnArea = Rect2()

@onready var spawn_time = $spawnTime

const TAKNITH = preload("res://scenes/taknith.tscn")

var deltaTime = 6.0
var offset = 1.5

func _ready():
	randomize()
	spawnArea = Rect2(0,0,width, height)
	set_time()

func spawn_enemy():
	var taknith_position = Vector2(randi()%width, randi()%height)
	
	var taknith 	= TAKNITH.instantiate()
	taknith.position = taknith_position
	add_child(taknith)
	return taknith_position
	
func set_time():
	var nextTime = deltaTime * (randf()-0.5)*2.0*offset
	spawn_time.wait_time = nextTime
	spawn_time.start()

func _on_spawning_timer_timeout():
	spawn_enemy()
	set_time()
