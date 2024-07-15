extends Node2D

const width = 70
const height = 900

var spawnArea = Rect2()

@onready var spawn_time = $SpawnTime

const OVATRULANT = preload("res://scenes/ovatrulant.tscn")

var deltaTime = 2.0
var offset = 0.2

func _ready():
	randomize()
	spawnArea = Rect2(0,0,width, height)
	set_time()

func spawn_enemy():
	var ovatrulant_position = Vector2(randi()%width, randi()%height)
	var ovatrulant = OVATRULANT.instantiate()
	ovatrulant.position = ovatrulant_position
	add_child(ovatrulant)
	return ovatrulant_position
	
func set_time():
	var nextTime = deltaTime * (randf()-0.5)*2.0*offset
	spawn_time.wait_time = nextTime
	
	spawn_time.start()

func _on_spawn_time_timeout():
	spawn_enemy()
	set_time()
