extends CharacterBody2D

@export var speed: float = -100;
@export var health: float = 100;

@onready var health_bar: ProgressBar = %HealthBar

func _ready() -> void:
	health_bar.max_value = health
	health_bar.value = health

func _physics_process(_delta: float) -> void:
	velocity = Vector2(speed, 0)
	move_and_slide()


func take_damage(damage: float):
	health -= damage;
	health_bar.value = health
	if health <= 0:
		queue_free()
