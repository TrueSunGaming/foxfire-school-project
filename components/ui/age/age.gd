class_name Age extends MarginContainer

var time_left_string: String:
	get:
		return Time.get_time_string_from_unix_time(refs.age_timer.time_left).substr(4) + str(refs.age_timer.time_left - floor(refs.age_timer.time_left)).substr(1, 2)

func _process(delta: float) -> void:
	$HBoxContainer/AgeLabel.text = str(refs.player.age) + " years old (" + time_left_string + " until birthday)"

func _on_button_pressed() -> void:
	refs.player.skip_age()
