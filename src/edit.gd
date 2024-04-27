class_name DeviceEdit
extends Node2D

var _deviceData: DeviceData = DeviceData.new()

@onready var _initialState: DeviceState = $InitialState

func _ready() -> void:
	_initialState.process_mode = Node.PROCESS_MODE_DISABLED

func save():
	_deviceData.save(_initialState)

func loadState(deviceData: DeviceData):
	_deviceData = deviceData
	_initialState.queue_free()
	_initialState = _deviceData.load() # Sjekk at denne funker
	add_child.call_deferred(_initialState)
	pass

func clear():
	for child in _initialState.get_children():
		child.queue_free()

func _on_save_pressed() -> void:
	save()
	clear()

func _on_load_pressed() -> void:
	loadState(_deviceData)


func _on_play_pressed() -> void:
	_initialState.process_mode = Node.PROCESS_MODE_INHERIT
