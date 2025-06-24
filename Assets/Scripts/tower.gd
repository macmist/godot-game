extends StaticBody2D

@export var health: float = 500

@onready var timer: Timer = %Timer
@onready var health_bar: ProgressBar = %HealthBar

func _ready() -> void:
	health_bar.max_value = health
	health_bar.value = health
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	
	
func _on_timer_timeout() -> void:
	const PROJECTILE = preload("res://Assets/Scenes/projectile.tscn")
	var new_projectile = PROJECTILE.instantiate()
	add_child(new_projectile)
	pass # Replace with function body.


func take_damage(damage: float):
	health -= damage;
	health_bar.value = health
	if health <= 0:
		queue_free()
