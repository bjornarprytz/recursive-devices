class_name DeviceBounds
extends Node2D

signal output(sample: Sample)

func spawnInput(specs: SampleSpecs):
	var sample = Create.sample(specs)
	$InputFaucet.add_child(sample) ## TODO: Consider whether this is the correct parent

func _on_output_sink_body_entered(body: Node2D) -> void:
	if body is Sample:
		output.emit(body)
