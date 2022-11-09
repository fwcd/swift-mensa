/// A geographical position.
public struct Coordinates: Codable, Hashable, CustomStringConvertible {
    public var latitude: Double
    public var longitude: Double

    private var latitudeDescription: String { "\(latitude >= 0 ? "N" : "S") \(abs(latitude))°" }
    private var longitudeDescription: String { "\(longitude >= 0 ? "E" : "W") \(abs(longitude))°" }
    public var description: String { "\(latitudeDescription), \(longitudeDescription)" }

    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }

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
