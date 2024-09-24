extends Node2D

func _on_yard_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	if refs.env.time_since_switch < 0.1: return
	
	refs.env.set_env("yard")
	refs.player.global_position += Vector2(0, 96)

func _on_cooking_trait_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	if refs.player.kitchen_death_experience: return
	if refs.player.kitchen_helped: return
	
	refs.dialogue.start_dialogue("cook_request")

func _on_sink_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	if refs.player.age >= 10: return
	if refs.player.kitchen_helped: return
	
	refs.dialogue.start_dialogue("sink_drown")
	refs.player.kitchen_death_experience = true

func _on_stove_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	if refs.player.age >= 10: return
	if refs.player.kitchen_helped: return
	
	refs.dialogue.start_dialogue("stove_burn")
	refs.player.kitchen_death_experience = true
