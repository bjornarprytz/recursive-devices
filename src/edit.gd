class_name DeviceEdit
extends Node2D

var _deviceConfig: DeviceConfig = DeviceConfig.new()

@onready var _initialState: DeviceState = $InitialState

func _ready() -> void:
	_initialState.process_mode = Node.PROCESS_MODE_DISABLED
	_deviceConfig.save(_initialState)

func save():
	_deviceConfig.save(_initialState)

func loadState(deviceData: DeviceConfig):
	_deviceConfig = deviceData
	_initialState.queue_free()
	_initialState = _deviceConfig.load()
	add_child.call_deferred(_initialState)

func clear():
	for child in _initialState.get_children():
		child.queue_free()

func _on_save_pressed() -> void:
	save()
	clear()

func _on_load_pressed() -> void:
	loadState(_deviceConfig)

func _on_play_pressed() -> void:
	_initialState.process_mode = Node.PROCESS_MODE_INHERIT
