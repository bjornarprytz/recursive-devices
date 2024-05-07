class_name DeviceData
extends Resource

var id: int = ResourceUID.create_id():
    get:
        return id
    set(value):
        push_error("Cannot change the id of a DeviceData")

var specs: DeviceSpecs

var _implementation: PackedScene

func saveImplementation(implementation: DeviceImplementation):
    var scene = PackedScene.new()
    
    scene.pack(implementation)
    
    _implementation = scene

func loadImplementation() -> Node2D:
    return _implementation.instantiate() as DeviceImplementation
