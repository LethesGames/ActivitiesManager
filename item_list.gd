extends ItemList

var numbers:int = 31
@onready var item_list: ItemList = %ItemList


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(Time.get_datetime_dict_from_system())
	item_list.set_max_columns(7)
	#for line in 5:
		#for column in 7:
			
	for number in numbers:
		number = number + 1
		item_list.add_item(str(number))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
