extends Area2D

@onready var game_manager: Node = %GameManager # % significa como Nome Único
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_exited(body: Node2D) -> void:
	print("plus 1 coin")
	game_manager.add_point() # chama a adição de pontos no game manager
	#queue_free()
	animation_player.play("pickup")
