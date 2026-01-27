extends MarginContainer
@onready var label: Label = $Label

@export var starting_gold = 150

var gold = starting_gold:
	set(new_gold):
		gold = new_gold
		label.text = "Gold: "+str(gold)
