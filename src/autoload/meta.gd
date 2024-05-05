class_name MetaGame
extends Node

## These should be DeviceConfig scenes
@export var puzzles: PackedScene

var _devices: Dictionary = {}

func getDeviceConfig(deviceId: String) -> DeviceData:
	if not _devices.has(deviceId):
		return null

	return _devices[deviceId]

func insertDeviceConfig(deviceConfig: DeviceData):
	_devices[deviceConfig.id] = deviceConfig

func get_devices() -> Array[DeviceData]:
	var devices: Array[DeviceData] = []
	
	devices.append_array(_devices.values())
		
	return devices
