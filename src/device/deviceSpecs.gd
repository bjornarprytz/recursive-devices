class_name DeviceSpecs
extends Resource

## The resource cost of the device
@export var cost: int

## How long this device takes to produce outputs (in seconds)
@export var duration: float

## Which input is required for the device to run
@export var inputs: Array[InputSpec]

## Which output is produced by the device
@export var outputs: Array[SampleSpecs]

## This is incremented when a new implementation is saved
var version: int

## Device IDs of the component devices
var components: Array[int] = []
