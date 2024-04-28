class_name DeviceSpecs
extends Resource


## How long this device takes to produce output
@export var duration: float

## Which input is required for the device to run
@export var inputs: Array[InputSpec]

## Which output is produced by the device
@export var output: Array[SampleSpecs]

## TODO: Side effects, like adding resources, waste management, etc.
