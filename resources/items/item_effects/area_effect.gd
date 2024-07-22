extends ItemEffect

enum AreaOrigin {CENTER, EDGE}

@export_group("Size")
@export var x_axis: int
@export var y_axis: int
@export var z_axis: int

@export_group("Misc")
@export var area_origin: AreaOrigin
