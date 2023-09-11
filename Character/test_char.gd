class_name TestChar extends Character.Bodypart

var character = Character.new()

func _init():
	character.pronoun = Character.Pronouns.Female
	var breasts = Character.Bodypart.new(Slots.Breasts, Sizes.UnHoly)