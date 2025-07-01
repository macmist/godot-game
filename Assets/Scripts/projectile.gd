class_name Projectile

extends Sprite2D

@export var speed: float = 400;
@export var damage: float = 25
@export var target: Fish


func _process(delta: float) -> void:
	# todo: this makes the projectiles homing. Would be nice to have some that goes in straight lines
	# or some other fun behaviours
	if target and is_instance_valid(target):
		var direction = (target.global_position - global_position).normalized()
		look_at(target.position)
		position += direction * speed * delta
	else:
		# todo: make projectile continue and disappear after x time or when it touches something else
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		if body.has_method("take_damage"):
			body.take_damage(damage)
			queue_free()
