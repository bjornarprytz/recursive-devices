class_name InputSpec
extends Resource

var _allowedShapes: Array[SampleSpecs.Shape]

func _init(allowedShapes: Array[SampleSpecs.Shape]):
	self._allowedShapes = allowedShapes

func validateInput(input: SampleSpecs) -> bool:
	return input != null and input.shape in _allowedShapes
