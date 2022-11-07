/// A geographical position.
public struct Coordinates: Codable, Hashable {
    public let latitude: Double
    public let longitude: Double

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        latitude = try container.decode(Double.self)
        longitude = try container.decode(Double.self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()

        try container.encode(latitude)
        try container.encode(longitude)
    }
}
