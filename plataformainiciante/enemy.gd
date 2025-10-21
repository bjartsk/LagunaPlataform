extends CharacterBody2D


# O inimigo, por enquanto, fica parado.
# Se quiser, podemos adicionar depois patrulha (ir e voltar).

#func _ready():
#	velocity = Vector2.ZERO  # fic parado


signal player_hit   # sinal para avisar a Main

func _ready():
	# Conecta o sinal do Area2D (Hitbox) quando algo entra
	$HitboxArea2D.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# Verifica se quem encostou é o Player
	if body.name == "Player":
		print("Player encostou no inimigo!")
		player_hit.emit()   # avisa a Main
