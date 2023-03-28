import Foundation

extension KeyCoder {

    static public func test() {
        saltTest()
        encodingTest()
    }

    static private func saltTest() {
        let testSaltSize = 20
        let testKeyEncoder = KeyEncoder(saltSize: testSaltSize)
        let salt1 = testKeyEncoder.generateSalt()
        assert(salt1.count == testSaltSize, "Wrong salt size")
        let salt2 = testKeyEncoder.generateSalt()
        assert(!salt1.elementsEqual(salt2), "Salt should not be equal")
    }

    static private func encodingTest() {
        let key = "1234567890a"
        let mask = [UInt8](repeating: 0xff, count: key.count)
        let testSaltSize = 10
        let testCoder = KeyCoder(saltSize: testSaltSize, mask: mask)
        let encoded = testCoder.encode(string: key)
        assert(encoded.count == key.count + testSaltSize * 2, "Wrong size of the encoded key")
        let decoded = testCoder.decode(bytes: encoded)
        assert(key == decoded, "Decoded key is not equal to original")
    }
}
