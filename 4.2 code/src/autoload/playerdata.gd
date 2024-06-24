extends Node
signal updated
signal player_died
var score :=0: set = set_score
var deaths:=0: set = set_deaths
func set_score(value:int):
	score = value
	emit_signal("updated")
func set_deaths(value:int):
	deaths = value
	emit_signal("player_died")
func reset() ->void:
	score=0
	deaths=0
