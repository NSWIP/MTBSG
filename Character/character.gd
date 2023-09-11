class_name Character

var pronoun: Pronouns
var name: String
var id: int
var bodyparts: Array

enum Pronouns{
	Male,
	Female,
}

class Bodypart:
	var size: Sizes
	var slot: Slots

	enum Sizes{
		Flat = 0,
		Tiny = 1,
		Small = 2,
		Average = 3,
		Large = 4,
		SuperLarge = 5,
		Massive = 6,
		UnHoly = 7,
	}

	enum Slots{
		Breasts,
		Penis,
		Balls,
	}

	func _init(arg_slot: Slots, arg_size: Sizes):
		slot = arg_slot
		size = arg_size

	func get_size_description() -> String:
		match size:
			Sizes.Flat:
				return "flat"
			Sizes.Tiny:
				return "tiny"
			Sizes.Small:
				return "small"
			Sizes.Average:
				return "average"
			Sizes.Large:
				return "large"
			Sizes.SuperLarge:
				return "super large"
			Sizes.Massive:
				return "massive"
			Sizes.UnHoly:
				return "unholy"
		return "???"

	func get_name() -> String:
		match slot:
			Slot.Breasts:
				return "breasts"
			Slot.Penis:
				return "penis"
			Slot.Balls:
				return "balls"
		return "???"