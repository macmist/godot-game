extends Node2D

@onready var score_label: Label = %ScoreLabel
@onready var fish_through_label: Label = %FishThroughLabel
@onready var game_over: Label = %GameOver


@export var maximum_units_through = 5

signal power_up()

var points: int = 0

func _ready() -> void:
	fish_through_label.text = str(maximum_units_through)
	score_label.text = str(points)
	

func _on_fish_detector_body_entered(body: Node2D) -> void:
	maximum_units_through -= 1
	fish_through_label.text = str(maximum_units_through)
	if maximum_units_through <= 0:
		game_over.visible = true
		propagate_call("on_game_over")

func on_point_scored():
	points += 1
	score_label.text = str(points)


func _on_spawner_fish_died() -> void:
	on_point_scored()


func _on_power_pressed() -> void:
	power_up.emit()
