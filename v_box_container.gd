extends VBoxContainer

var days_by_month = {
	1: 31,
	2: 29,
	3: 31,
	4: 30,
	5: 31,
	6: 30,
	7: 31,
	8: 31,
	9: 30,
	10: 31,
	11: 30,
	12: 31	
}
@onready var h_box_container_0: HBoxContainer = $HBoxContainer0
@onready var v_box_container: VBoxContainer = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var current_month = Time.get_datetime_dict_from_system().get("month")
	var current_year = Time.get_datetime_dict_from_system().get("year")
	
	var days_of_the_month = (
		days_by_month.get(current_month)
	)
	
	var current_month_dictionary = Time.get_datetime_dict_from_datetime_string(
		str(current_year) + "-" + str(current_month) + "-01:01:00:00", 
		true)
	
	_generate_calendar_buttons(current_month_dictionary, current_month, current_year, days_of_the_month)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _generate_calendar_buttons(current_month_dictionary, current_month, current_year, days_of_the_month) -> void:
	var counter:int = 1
	var child_pos =  current_month_dictionary.get("weekday") - 1 
	var weeks = v_box_container.get_children(false)
	for week in weeks:
		var loop:bool = true
		while loop:
			if child_pos < 0: 
				var btn:Button = week.get_child(6)
				btn.text = str(counter)
				btn.disabled = false
				btn.connect("pressed", _button_pressed.bind(btn.text, str(current_month), str(current_year)))			
				counter += 1
				child_pos = 0
				loop = false
				pass
			elif child_pos < 7:
				if counter <= days_of_the_month:
					var btn:Button = week.get_child(child_pos)
					btn.text = str(counter)
					btn.disabled = false
					btn.connect("pressed", _button_pressed.bind(btn.text, str(current_month), str(current_year)))
					counter += 1
					child_pos += 1
				else:
					break
			else:
				child_pos = 0
				loop = false
		pass		
	pass
	pass

func _button_pressed(day: String, month: String, year: String) -> void:
	print(day + "-" + month + "-" + year)
	pass
