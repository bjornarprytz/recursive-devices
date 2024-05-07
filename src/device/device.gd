class_name Device
extends Node2D

signal clicked(device: Device)

var data: DeviceData

var missing_inputs: Array[InputSpec]

func _ready() -> void:
	missing_inputs = data.specs.inputs.duplicate()

func _on_sensor_body_entered(body: Node2D) -> void:
	if body is Sample:
		_try_add_input(body)

func _try_add_input(sample: Sample):
	if missing_inputs.size() == 0:
		return
	
	for i in range(missing_inputs.size()):
		if missing_inputs[i].validateInput(sample.specs):
			missing_inputs.remove_at(i)
			sample.queue_free()
			break

	if missing_inputs.size() == 0:
		_on_all_inputs_received()

func _on_all_inputs_received():
	for i in range(data.specs.outputs.size()):
		var outputSpec = data.specs.outputs[i]
		var sample = Create.sample(outputSpec)
		print("MY position: ", global_position)
		sample.global_position = global_position + Vector2(0, 50)
		print("Sample position: ", sample.global_position)
		get_parent().add_child.call_deferred(sample)
	
	missing_inputs = data.specs.inputs.duplicate()

func _on_button_pressed() -> void:
	clicked.emit(self)
