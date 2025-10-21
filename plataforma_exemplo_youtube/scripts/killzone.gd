extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void: # qdo o jogador entre na Killzone ele inicia o Timer e chama a função abaixo ao acabar o tempo
	print("You Died!")
	Engine.time_scale = 0.5 # muda a escala de tempo para metade para deixaa a morte mais legal "cooler" (lenta)
	body.get_node("CollisionShape2D").queue_free() # body é o player. Portanto, pega o player e remos o collision para ele cair no cenário qdo morre
	timer.start() 


func _on_timer_timeout() -> void:
	Engine.time_scale = 1 # volta à velocidade normal do jgo
	get_tree().reload_current_scene() # pega a árvore e reinicia o jogo (reinicia a cena) qdo o timer termina o tempo determinado
