extends Sprite2D

@export var speed: float = 400;
@export var damage: float = 25

func _physics_process(delta: float) -> void:
	global_position += Vector2(speed * delta, 0);


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		print("I can damage this")
		body.take_damage(damage)
		queue_free()
	pass # Replace with function body.
