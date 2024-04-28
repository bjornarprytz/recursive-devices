class_name SampleSpecs
extends Resource

enum Shape {
	CIRCLE,
	SQUARE
}

enum Properties {
	Magnetic,
	Conductive,
	Bouncy,
}

@export var shape: Shape = Shape.SQUARE
@export var properties: Array[Properties] = []

func equals(other: SampleSpecs) -> bool:
	return shape == other.shape and properties == other.properties
