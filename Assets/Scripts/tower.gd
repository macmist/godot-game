extends StaticBody2D

@export var health: float = 500

@onready var timer: Timer = %Timer
@onready var health_bar: ProgressBar = %HealthBar
@export var parent_for_projectiles: NodePath

var target: Fish

var fishes_in_range: Array[Fish] = []

var projectile_upgrades: Array[BaseProjectileStrategy] = []

func _ready() -> void:
	health_bar.max_value = health
	health_bar.value = health
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	projectile_upgrades.append(FancyProjectileStrategy.new())
	
	
func find_closest():
	var enemy = null
	if fishes_in_range.is_empty():
		return
	var closest_distance: float = INF
	for fish in fishes_in_range:
		var distance = position.distance_to(fish.global_position)
		if distance < closest_distance:
			enemy = fish
			closest_distance = distance
	draw_line(position,enemy.position, "black")
	return enemy
		
func shoot() -> void:
	target = find_closest()
	if target == null:
		return
	const PROJECTILE = preload("res://Assets/Scenes/projectile.tscn")
	var new_projectile = PROJECTILE.instantiate()
	
	new_projectile.global_position = global_position
	new_projectile.target = target
	
	
	for upgrade in projectile_upgrades:
		upgrade.apply_upgrade(new_projectile)
		

	
	var parent = get_node(parent_for_projectiles)
	parent.add_child(new_projectile)
	

func _on_timer_timeout() -> void:
	shoot()
	pass


func take_damage(damage: float):
	health -= damage;
	health_bar.value = health
	if health <= 0:
		queue_free()


func on_game_over():
	queue_free()


func _on_power_pressed() -> void:
	projectile_upgrades.append(DamageProjectileStrategy.new())
	

func _on_range_body_entered(body: Node2D) -> void:
	if body is Fish and !fishes_in_range.has(body):
		print("Found a fish")
		fishes_in_range.push_front(body)


func _on_range_body_exited(body: Node2D) -> void:
	if body is Fish:
		print("a fish is exiting")
		var idx = fishes_in_range.find(body)
		if idx != -1:
			fishes_in_range.remove_at(idx)
		
