extends CanvasLayer # Diz que este script controla um nó do tipo CanvasLayer (usado para interface / HUD)

signal start_game # Cria um "sinal" chamado start_game, que poderá ser conectado em outros nós (ex.: Main)

func _ready(): # Função chamada automaticamente quando a cena entra em funcionamento
	$StartButton.pressed.connect(_on_start_pressed)
	# Aqui pegamos o nó "StartButton" e conectamos o sinal "pressed" dele (quando for clicado) 
	# para chamar a função _on_start_pressed deste script
	$GameOverLabel.hide()  # garante invisível no início


func _on_start_pressed(): # Função chamada quando o botão Start for apertado
	$StartButton.hide()   # Esconde o botão da tela
	start_game.emit()   # Dispara (emite) o sinal "start_game" para avisar a Main

func update_lives(lives: int):
	# Atualiza o texto na tela
	$LivesLabel.text = "Vidas: %d" % lives
	
func show_game_over():
	$GameOverLabel.show()

func update_score(score: int):
	# Atualiza o placar na tela
	$ScoreLabel.text = "Pontos: %d" % score
