import Foundation

class KeyDecoder {
    private let saltSize: Int

    init(saltSize: Int) {
        self.saltSize = saltSize
    }

    func decode(bytes: [UInt8], mask: [UInt8]) -> String {
        let encodedKey = bytes[saltSize..<bytes.count - saltSize]
        return String(decoding: zip(encodedKey, mask).map(^), as: UTF8.self)
    }

}
