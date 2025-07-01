class_name FastestEnemyStrategy
extends BaseTargetStrategy


func get_target(_position: Vector2, enemy_array: Array[Fish]):
	if enemy_array.is_empty():
		return null
	var fastest: float = -INF
	var enemy = null
	for fish in enemy_array:
		if fish.speed > fastest:
			fastest = fish.speed
			enemy = fish
	return enemy
