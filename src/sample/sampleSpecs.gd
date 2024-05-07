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

@export var shape: Shape = Shape.SQUARE:
    set(value):
        if value == shape:
            return
        shape = value
        emit_changed()

@export var properties: Array[Properties] = []:
    set(value):
        if value == properties:
            return
        properties = value
        emit_changed()

func equals(other: SampleSpecs) -> bool:
    return shape == other.shape and properties == other.properties
