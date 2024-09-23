extends Node2D

func _on_upstairs_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	
	refs.env.set_env("floor2")

func _on_yard_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	if refs.env.time_since_switch < 0.1: return
	
	refs.env.set_env("yard")
	refs.player.global_position += Vector2(0, 96)

func _on_cooking_trait_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	
	refs.player.add_trait("cook")

func _on_sink_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	if refs.player.age >= 10: return
	
	refs.player.add_trait("hydrophobia")
	refs.player.remove_trait("cook")

func _on_stove_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	if refs.player.age >= 10: return
	
	refs.player.add_trait("pyrophobia")
	refs.player.remove_trait("cook")
