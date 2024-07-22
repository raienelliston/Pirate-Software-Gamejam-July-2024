class_name Potion
extends Item

enum PotionType {OFFENCE, SUPPORT}
enum PotionAttribute {FIRE, ICE, LIGHT}

@export_category("Appearance")
@export var potion_color: Color

@export_category("Effect Stats")
@export var potion_type: PotionType
@export var potion_attribute: PotionAttribute
