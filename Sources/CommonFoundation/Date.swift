#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

extension JSONDecoder.DateDecodingStrategy {
    public static let iso8601IncludingFractionalSeconds = custom { encoder in
        let string = try encoder.singleValueContainer().decode(String.self)
        do {
            return try Date(string, strategy: .iso8601IncludingFractionalSeconds)
        } catch {
            return try Date(string, strategy: .iso8601)
        }
    }
}

extension JSONEncoder.DateEncodingStrategy {
    public static let iso8601IncludingFractionalSeconds = custom { date, encoder in
        var container = encoder.singleValueContainer()
        try container.encode(date.formatted(.iso8601IncludingFractionalSeconds))
    }
}

extension ParseStrategy where Self == Date.ISO8601FormatStyle {
    public static var iso8601IncludingFractionalSeconds: Self {
        Self(includingFractionalSeconds: true)
    }
}

extension FormatStyle where Self == Date.ISO8601FormatStyle {
    public static var iso8601IncludingFractionalSeconds: Self {
        Self(includingFractionalSeconds: true)
    }
}
