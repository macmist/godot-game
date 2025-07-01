class_name ClosestTargetStrategy
extends BaseTargetStrategy

func get_target(position: Vector2, enemy_array: Array[Fish]):
	if enemy_array.is_empty():
		return null
	var closest_distance: float = INF
	var enemy = null
	for fish in enemy_array:
		var distance = position.distance_to(fish.global_position)
		if distance < closest_distance:
			enemy = fish
			closest_distance = distance
	return enemy
