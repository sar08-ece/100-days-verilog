A Universal Shift Register (USR) is a digital component used for data storage and manipulation. It can perform multiple operations such as Hold, Shift Left, Shift Right, and Parallel Load, controlled by select signals.

 Supports 4 modes of operation:

00 → Hold (No change)

01 → Shift Right (MSB replaced by serial_in_right)

10 → Shift Left (LSB replaced by serial_in_left)

11 → Parallel Load (Loads data from data_in).