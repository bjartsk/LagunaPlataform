extends Area2D



# Por enquanto não faz nada além de existir no mundo.
# Depois vamos conectar o sinal para dar pontos ao Player.


signal collected   # sinal que avisa a Main

func _ready():
	# Conecta quando alguém entra na área do Collectable
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		print("Player tocou no Collectable!")
		collected.emit()   # avisa a Main
