extends Node


signal score_updated(new_score)
signal deaths_updated(new_deaths)

var score = 0
var deaths = 0

func add_score():
	score += 1
	
	score_updated.emit(score)

func add_death():
	deaths += 1
	deaths_updated.emit(deaths)
