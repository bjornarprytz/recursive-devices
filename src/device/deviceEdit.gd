class_name DeviceEdit
extends Node2D

## Inject camera controls
@export var camera: Camera2D

## The branch of the device tree that is currently being edited
var configStack: Array[DeviceData] = []

var _currentConfig: DeviceData:
    get:
        if configStack.size() == 0:
            return null
        return configStack[0]

@onready var _deviceState: DeviceImplementation = $DeviceImplementation
@onready var _deviceId: RichTextLabel = $DeviceId
@onready var _inputSelect: OptionButton = $InputSelect
@onready var _outputSelect: OptionButton = $OutputSelect

func _ready() -> void:
    for inputType in SampleSpecs.Shape.keys():
        _inputSelect.add_item(inputType)
    
    for outputType in SampleSpecs.Shape.keys():
        _outputSelect.add_item(outputType)

    configStack.push_front(DeviceData.new())

func _onDeviceClicked(device: Device) -> void:
    _saveConfig(_currentConfig)

    var nestedConfig: DeviceData = Meta.getDeviceConfig(device.data.deviceId)
    
    assert(nestedConfig != null, "No config found for device ID: " + str(device.specs.deviceId))

    var originalCameraPosition = camera.global_position
    var tween = create_tween().set_parallel()
    tween.set_ease(Tween.EASE_IN)
    tween.tween_property(camera, "zoom", Vector2(50, 50), 2.0)
    tween.set_trans(Tween.TRANS_LINEAR)
    tween.tween_property(camera, "global_position", device.global_position, .4)
    await tween.finished
    configStack.push_front(nestedConfig)
    _loadConfig()
    camera.zoom = Vector2(1, 1)
    camera.global_position = originalCameraPosition

func _loadConfig() -> void:
    var config = _currentConfig

    if _deviceState != null:
        _deviceState.queue_free()

    _deviceState = config.loadImplementation()
    add_child.call_deferred(_deviceState)
    _deviceId.text = str(config.id)

    for d in _deviceState.get_devices():
        d.clicked.connect(_onDeviceClicked)

func _saveConfig(config: DeviceData) -> void:
    if config == null:
        return

    config.saveState(_deviceState)
    Meta.insertDeviceConfig(config) # Save the current config
    
func _on_play_pressed() -> void:
    _deviceState.run()

func _on_back_pressed() -> void:
    _saveConfig(_currentConfig) # TODO: Reconsider saving here. At least make sure the current state is reset (after running)
    configStack.pop_front()

    var tween = create_tween().set_parallel()
    tween.set_ease(Tween.EASE_IN)
    tween.tween_property(camera, "zoom", Vector2(.2, .2), 2.0)
    tween.set_ease(Tween.EASE_OUT_IN)
    tween.set_trans(Tween.TRANS_LINEAR)
    await tween.finished
    _loadConfig()
    camera.zoom = Vector2(1, 1)

func _on_input_select_item_selected(index: int) -> void:
    _currentConfig.specs.inputs = [InputSpec.new([index as SampleSpecs.Shape])]

func _on_output_select_item_selected(index: int) -> void:
    var output = SampleSpecs.new()
    output.shape = index as SampleSpecs.Shape
    _currentConfig.specs.outputs = [output]
