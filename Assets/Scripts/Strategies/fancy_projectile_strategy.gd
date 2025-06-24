class_name FancyProjectileStrategy
extends BaseProjectileStrategy

const PARTICLES = preload("res://Assets/Scenes/particles.tscn")

func apply_upgrade(projectile: Projectile):
	var projectile_particle: Node2D = PARTICLES.instantiate()
	projectile.add_child(projectile_particle)
	projectile_particle.global_position = projectile.position
	
