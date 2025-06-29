class_name Projectile

extends Sprite2D

@export var speed: float = 400;
@export var damage: float = 25
@export var target: Fish

func _process(delta: float) -> void:
	if target and is_instance_valid(target):
		var direction = (target.global_position - global_position).normalized()
		look_at(target.position)
		position += direction * speed * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		if body.has_method("take_damage"):
			body.take_damage(damage)
			queue_free()
	pass # Replace with function body.
