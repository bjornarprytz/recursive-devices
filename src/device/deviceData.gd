class_name DeviceData
extends Resource

var id: String = Guid.v4()
var specs: DeviceSpecs

var _implementation: PackedScene

func saveImplementation(implementation: DeviceImplementation):
    var scene = PackedScene.new()
    
    scene.pack(implementation)
    
    implementation = scene

func loadImplementation() -> Node2D:
    return _implementation.instantiate() as DeviceImplementation
