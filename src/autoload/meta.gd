class_name MetaGame
extends Node

## These should be DeviceConfig scenes
@export var puzzles: PackedScene

var _devices: Dictionary = {}

func getDeviceConfig(deviceId: int) -> DeviceConfig:
	if not _devices.has(deviceId):
		return null

	return _devices[deviceId]

func insertDeviceConfig(deviceConfig: DeviceConfig):
	_devices[deviceConfig.id] = deviceConfig

func get_devices() -> Array[DeviceConfig]:
	var devices : Array[DeviceConfig] = []
	
	devices.append_array(_devices.values())
		
	return devices
