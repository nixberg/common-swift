#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

extension URL {
    public init(valid string: String) {
        self.init(string: string, encodingInvalidCharacters: false)!
    }
}
