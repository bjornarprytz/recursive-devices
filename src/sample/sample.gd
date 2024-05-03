@tool

class_name Sample
extends RigidBody2D

@export var specs: SampleSpecs:
	set(value):
		if specs == value:
			return
		specs = value
		specs.changed.connect(_update_shape)

var _collider: CollisionPolygon2D:
	get:
		return $Shape

var _shape: RegularPolygon:
	get:
		return $Polygon

func _ready() -> void:
	_update_shape()

func _update_shape() -> void:
	print("Updating shape")
	if specs.shape == SampleSpecs.Shape.CIRCLE:
		_shape.n_sides = 25
		_collider.polygon = _shape.polygon
	elif specs.shape == SampleSpecs.Shape.SQUARE:
		_shape.n_sides = 4
		_collider.polygon = _shape.polygon
