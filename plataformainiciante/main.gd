extends Node2D
# Esse script controla a cena principal (Main), que é do tipo Node2D.
# Aqui é onde juntamos HUD, Player e Plataforma.

var lives = 3 # número inicial de vidas
var score := 0        # <<< adicionamos a pontuação
var is_respawning := false  # evita múltiplas perdas de vida

func _ready():
	 
	$HUD.start_game.connect(_on_start_game)
	# Conecta o sinal do HUD com a função da Main
	# Conecta o sinal "start_game" do nó HUD com a função _on_start_game deste script.
	# Isso significa: quando o HUD emitir o sinal (apertar Start), a função _on_start_game será executada.
	$HUD.update_lives(lives)  # mostra 3 no começo
	$HUD.update_score(score)  # <<< mostra 0 no começo
	
	# conecta o inimigo
	$Enemy.player_hit.connect(_on_player_hit)
	$Collectable.collected.connect(_on_collectable_collected)  # <<< conecta o sinal

func _on_start_game():
	# Libera o player para se mover
	$Player.can_move = true
	
func _on_collectable_collected():
	# Aumenta 10 pontos e atualiza HUD
	score += 10
	$HUD.update_score(score)
	print("Pontos atuais: %d" % score)
	
func _process(delta):
	# Só checa queda se não estiver em respawn (renascimento)
	if not is_respawning and $Player.position.y > 400 and $Player.can_move:
		lose_life()

func _on_player_hit():
	# Essa função é chamada quando o inimigo emite o sinal "player_hit"
	# (ou seja, quando o Player encosta no inimigo).
	if not is_respawning:
		# Verifica se o Player não está em processo de reset (respawn).
		# Isso evita perder várias vidas de uma vez só durante o mesmo contato.
		lose_life()
		# Se não estiver em respawn → chama a função que tira 1 vida do jogador.

func lose_life():
	lives -= 1
	$HUD.update_lives(lives)
	
	# trava o Player imediatamente para evitar múltiplas perdas
	$Player.can_move = false

	if lives > 0:
		is_respawning = true   # trava para não repetir
		reset_player()
	else:
		game_over()
		
func reset_player():
	# Coloca o player de volta no ponto desejado
	$Player.position = Vector2(300, 100)
	$Player.velocity = Vector2.ZERO
	
	# Pequeno delay para simular respawn seguro
	await get_tree().create_timer(0.5).timeout
	
	$Player.can_move = true # já começa andando sem precisar apertar Start
	is_respawning = false  # libera de novo
	print("Perdeu 1 vida! Restam %d vidas." % lives)
	# $HUD.get_node("StartButton").show()  # reaparece o botão Start

func game_over():
	print("Game Over!")
	$Player.can_move = false
	# Aqui você pode exibir um Label "Game Over" no HUD, ou reiniciar a cena:
	# get_tree().reload_current_scene()
	# Aqui você pode mostrar uma tela de fim de jogo, reiniciar cena, etc.
	$HUD.show_game_over()
