extends Sprite2D

@onready var timer: Timer = %Timer

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	
	
	

func _on_timer_timeout() -> void:
	const PROJECTILE = preload("res://Assets/Scenes/projectile.tscn")
	var new_projectile = PROJECTILE.instantiate()
	add_child(new_projectile)
	pass # Replace with function body.
