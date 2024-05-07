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

- Generic Inputs:
  - If a device only cares about shape, for instance, all other characteristics could be ignored, except they are highly relevant to the physics simulation.
  - If I make it generic, then the simulation would have to make concrete versions with various characteristics.
  - Shit, this is something to keep in mind. It might not be a huge problem, if there aren't too many permutations
  - Another possibility: Don't spawn all permutatinos, but give the input _every_ characteristic. Maybe not a good idea.
  - Could alternatively use a random sample of permutations.

## TODO

- A few default implementations
  - Change shape square -> circle
  - Vice versa

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
