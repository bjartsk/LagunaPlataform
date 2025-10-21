extends Node

var score = 0
@onready var score_label: Label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins!"
	print(score)
	
	if score == 9:
		print("Jogo chegou ao final! Parabéns")
		
		get_tree().quit() # Fecha o jogo
