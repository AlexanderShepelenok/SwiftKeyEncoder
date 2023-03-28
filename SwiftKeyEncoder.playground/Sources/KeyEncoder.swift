import Foundation

class KeyEncoder {

    private let saltSize: Int

    init(saltSize: Int) {
        self.saltSize = saltSize
    }

    /**
     Generate a random set of bytes that is added to the key at the beginning and end.
     */
    func generateSalt() -> [UInt8] {
        (0..<saltSize).reduce(into: [UInt8]()) { bytes, _ in
            bytes.append(UInt8.random(in: 0...UInt8.max))
        }
    }

    func encode(string: String, mask: [UInt8]) -> [UInt8] {
        let encoded = zip(Array(string.utf8), mask).map(^)
        return generateSalt() + encoded + generateSalt()
    }

}
