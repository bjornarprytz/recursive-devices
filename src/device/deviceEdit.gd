class_name DeviceEdit
extends Node2D

var config: DeviceConfig = DeviceConfig.new()

@onready var _deviceState: DeviceState = $DeviceState

func _ready() -> void:
    config.saveState(_deviceState)

    for d in _deviceState.get_devices():
        d.clicked.connect(_onDeviceClicked)

func _onDeviceClicked(device: Device) -> void:
    # TODO: Find DeviceConfig based on a static lookup. So devices need and ID
    # TODO: Load that device, after saving current
    config.saveState(device.sta)
    _loadState()

func _loadState():
    if _deviceState != null:
        _deviceState.queue_free()
    _deviceState = config.loadState()
    add_child.call_deferred(_deviceState)

func _saveState():
    config.saveState(_deviceState)

func _on_save_pressed() -> void:
    _saveState()
    
func _on_load_pressed() -> void:
    _loadState()
    
func _on_play_pressed() -> void:
    _deviceState.run()
