class_name MetaGame
extends Node

var _devices: Dictionary = {}

func _ready() -> void:

	var d1 = DeviceData.new()
	d1.specs = DeviceSpecs.new()

func getDeviceConfig(deviceId: int) -> DeviceData:
	if not _devices.has(deviceId):
		return null

	return _devices[deviceId]

func insertDeviceConfig(deviceConfig: DeviceData):
	_devices[deviceConfig.id] = deviceConfig

func get_devices() -> Array[DeviceData]:
	var devices: Array[DeviceData] = []
	
	devices.append_array(_devices.values())
		
	return devices
