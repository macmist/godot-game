class_name Fish

extends CharacterBody2D

@export var speed: float = -100;
@export var health: float = 100;
@export var damage: float = 50;

@onready var health_bar: ProgressBar = %HealthBar

signal died()

func _ready() -> void:
	health_bar.max_value = health
	health_bar.value = health

func _physics_process(_delta: float) -> void:
	velocity = Vector2(speed, 0)
	move_and_slide()
	
	var collision_count = get_slide_collision_count()
	for i in collision_count:
		var collision_info = get_slide_collision(i)
		var collider = collision_info.get_collider()
		
		if collider.has_method("take_damage"):
			collider.take_damage(damage)
			queue_free()


func take_damage(damage: float):
	health -= damage;
	health_bar.value = health
	if health <= 0:
		died.emit()
		queue_free()
		
func on_game_over():
	queue_free()
