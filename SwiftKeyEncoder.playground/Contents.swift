// Check if encoding/decoding is working properly
KeyCoder.test()

/**
 A random set of 32 bytes generated with "head -c32 /dev/random | xxd -i".
 User to XOR our key.
 The mask size must be greater than or equal to the length of the encoded key.
 */
let mask: [UInt8] = [<#Set of bytes#>]

// Size of randomly generated data added to the beginning and end of the encoded key
let saltSizeInBytes = 20

let keyCoder = KeyCoder(saltSize: saltSizeInBytes, mask: mask)
keyCoder.printEncodedKey("<#Key to encode#>", named: "<#Key variable name#>")

