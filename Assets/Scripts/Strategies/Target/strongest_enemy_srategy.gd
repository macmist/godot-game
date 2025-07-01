class_name StringestEnemyStrategy
extends BaseTargetStrategy


func get_target(_position: Vector2, enemy_array: Array[Fish]):
	if enemy_array.is_empty():
		return null
	var strongest: float = -INF
	var enemy = null
	for fish in enemy_array:
		if fish.damage > strongest:
			strongest = fish.damage
			enemy = fish
	return enemy
