class_name Bag
extends Resource

signal bag_contents_changed(items_in_bag)

@export var bag_contents: Array[Item] = []

func addItem(item: Item) -> void:
	bag_contents.append(item)
	bag_contents_changed.emit(item)
	
func getItems() -> Array[Item]:
	return bag_contents
	
func clearItems() -> void:
	bag_contents = []
	bag_contents_changed.emit([])
