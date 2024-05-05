# recursive-devices

The concept is to create devices that take input and produce output.

- A device is a square, and each side has one port
  - Within the device, physical laws apply
  - A physical simulation runs to determine the effects a device has
    - Which outputs and side effects there are
- Device versions
  - If you update a device, you make a new version, which has different specs, but the same ID. If you want to update devices of the same type, you need to pay the resource defficit

- Gizmo
  - Take no physical space, but conducts electricity and adds control, through buttons, wiring, effectuators (gravity field) etc.

## TODO

- Figure out how to structure the device data
  - It's currently spread out over mulitple data structures:
    - DeviceConfig
    - DeviceSpecs
    - DeviceState
    - InputSpec
  - Essentially, I want each device to have one data structure that describes how to instantiate an abstracted version, and a detailed one, which contains the implementation
  - The abstracted version:
    - Resource Cost (to build)
    - Duration
    - Input/Output
    - Device Manifest (which other devices are used)
    - Version Number
  - The detailed version
    - Input/Output
    - Initial Internal State
    - From the properties above, Compute the abstracted version

- Add content:
  - Initial puzzle
  - Some "default" implementations that cannot be edited

- Edit devices
  - Set desired I/O (cannot be changed)
  - Add menu of elements to add
    - Sample
    - Device
  - Run test
- Store finished devices
- Run simulation
- Add general dynamics
  - Heat, magnetism, etc.

- Push release with `./push_release.sh`

### Extra

- itch.io
  - Rename the game
  - Write a short description
  - Make a nice cover image (630x500)
  - Add screenshots (recommended: 3-5)
  - Pick a genre
  - Add a tag or two
  - Publish a devlog on instagram

### Meta

- Figure out how to develop for mobile
  - How to use the on-screen keyboard
