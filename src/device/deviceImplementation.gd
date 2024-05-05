class_name DeviceImplementation
extends Node2D

signal changed(implementation: DeviceImplementation) # # TODO: Use this to determine whether or not to auto save this device
signal output(sample: Sample)

var implementation: Node2D:
	get:
		return $State
var _devices: Node2D:
	get:
		return $State/Devices
var _samples: Node2D:
	get:
		return $State/Samples

var _bounds: DeviceBounds:
	get:
		return $DeviceBounds

func _ready():
	_bounds.output.connect(_onOutput)

func run():
	implementation.process_mode = Node.PROCESS_MODE_INHERIT

func pause():
	implementation.process_mode = Node.PROCESS_MODE_DISABLED

func _onOutput(sample: Sample):
	output.emit(sample)

func get_devices() -> Array[Device]:
	var devices: Array[Device] = []
	for device in _devices.get_children():
		if device is Device:
			devices.append(device)
	return devices
