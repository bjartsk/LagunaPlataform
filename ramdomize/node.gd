extends Node

func _ready():
	seed(100)
	print("🔴 SEM randomize() ------------------")
	for i in range(5):
		print(randi_range(1, 100))  # gera de 1 a 100

	# Agora reinicia o jogo e verá que sempre repete os mesmos 5 números

	print("🟢 COM randomize() ------------------")
	randomize()  # inicializa o gerador com base no relógio do PC
	for i in range(5):
		print(randi_range(1, 100))  # gera de 1 a 100
