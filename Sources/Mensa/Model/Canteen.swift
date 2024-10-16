/// Information about a canteen.
public struct Canteen: Codable, Identifiable, Hashable, Sendable {
    public var id: Int
    public var name: String
    public var city: String
    public var address: String
    public var coordinates: Coordinates?

    public init(
        id: Int,
        name: String,
        city: String,
        address: String,
        coordinates: Coordinates? = nil
    ) {
        self.id = id
        self.name = name
        self.city = city
        self.address = address
        self.coordinates = coordinates
    }
}
