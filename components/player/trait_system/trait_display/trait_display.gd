class_name TraitDisplay extends PanelContainer

@export var index: int:
	set(val):
		index = val
		reload_trait_obj()

var trait_obj: Trait

func reload_trait_obj() -> void:
	trait_obj = Trait.get_trait(global.end_traits[index])

func _process(delta: float) -> void:
	$VBoxContainer/HBoxContainer/Prev.disabled = index == 0
	$VBoxContainer/HBoxContainer/Next.disabled = index >= global.end_traits.size() - 1
	
	if not trait_obj: return reload_trait_obj()
	$VBoxContainer/Title.text = trait_obj.name
	$VBoxContainer/Description.text = trait_obj.description

func _on_prev_pressed() -> void:
	index -= 1

func _on_next_pressed() -> void:
	index += 1
