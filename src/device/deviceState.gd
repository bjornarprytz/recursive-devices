class_name DeviceState
extends Node2D

signal changed(state: DeviceState)

var state: Node2D:
	get:
		return $State
var _devices: Node2D:
	get:
		return $State/Devices
var _samples: Node2D:
	get:
		return $State/Samples

func run():
	state.process_mode = Node.PROCESS_MODE_INHERIT

func pause():
	state.process_mode = Node.PROCESS_MODE_DISABLED

func get_devices() -> Array[Device]:
	var devices : Array[Device] = []
	for device in _devices.get_children():
		if device is Device:
			devices.append(device)
	return devices
