class_name DeviceEdit
extends Node2D

## This is the puzzle you have to solve
var configStack: Array[DeviceConfig] = []

var _currentConfig: DeviceConfig:
    get:
        if configStack.size() == 0:
            return null
        return configStack[0]

@onready var _deviceState: DeviceState = $DeviceState
@onready var _deviceId: RichTextLabel = $DeviceId

func _ready() -> void:
    var puzzle = Meta.puzzles
    var config = DeviceConfig.new(puzzle.instantiate() as DeviceState)
    configStack.push_front(config)
    _loadConfig()

func _onDeviceClicked(device: Device) -> void:
    _saveConfig(_currentConfig)

    var nestedConfig: DeviceConfig = Meta.getDeviceConfig(device.specs.deviceId)

    if nestedConfig == null: # TODO: This is just a temporary solution until we have a proper way to create new devices
        nestedConfig = DeviceConfig.new(Meta.puzzles.instantiate() as DeviceState)
        Meta.insertDeviceConfig(nestedConfig)
    
    assert(nestedConfig != null, "No config found for device ID: " + str(device.specs.deviceId))

    configStack.push_front(nestedConfig)
    _loadConfig()

    print("Clicked on device: " + str(device.specs.deviceId))

func _loadConfig() -> void:
    ## TODO: Transition by zooming into the device

    var config = _currentConfig

    if _deviceState != null:
        _deviceState.queue_free()

    _deviceState = config.loadState()
    add_child.call_deferred(_deviceState)
    _deviceId.text = str(config.id)

    for d in _deviceState.get_devices():
        d.clicked.connect(_onDeviceClicked)

func _saveConfig(config: DeviceConfig) -> void:
    if config == null:
        return

    config.saveState(_deviceState)
    Meta.insertDeviceConfig(config) # Save the current config
    
func _on_play_pressed() -> void:
    _deviceState.run() ## TODO: Fix the fact that devices aren't clickable when the state is paused.

func _on_back_pressed() -> void:
    _saveConfig(_currentConfig) # TODO: Reconsider saving here. At least make sure the current state is reset (after running)
    configStack.pop_front()
    _loadConfig()
