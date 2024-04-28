class_name DeviceState
extends Node2D

signal changed(state: DeviceState)

var state: Node2D:
	get:
		return $State
var devices: Node2D:
	get:
		return $State/Devices
var samples: Node2D:
	get:
		return $State/Samples

func run():
	state.process_mode = Node.PROCESS_MODE_INHERIT

func pause():
	state.process_mode = Node.PROCESS_MODE_DISABLED
