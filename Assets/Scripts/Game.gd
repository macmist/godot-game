extends Node2D

@onready var score_label: Label = %ScoreLabel
@onready var fish_through_label: Label = %FishThroughLabel
@export var maximum_units_through = 5

var points: int = 0

func _ready() -> void:
	fish_through_label.text = str(maximum_units_through)
	score_label.text = str(points)
	

func _on_fish_detector_body_entered(body: Node2D) -> void:
	maximum_units_through -= 1
	fish_through_label.text = str(maximum_units_through)

func on_point_scored():
	points += 1
	score_label.text = str(points)


func _on_spawner_fish_died() -> void:
	on_point_scored()
