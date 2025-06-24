extends Marker2D

@export var spawn_interval_min:float = 2.0
@export var spawn_interval_max:float = 3.0

@export var items: Array[PackedScene] = []


func _ready() -> void:
	spawn_something()


func spawn_something():
	var FISH = items.pick_random()
	var new_fish = FISH.instantiate()
	add_child(new_fish)
	get_tree().create_timer(randf_range(spawn_interval_min, spawn_interval_max)).timeout.connect(spawn_something)
