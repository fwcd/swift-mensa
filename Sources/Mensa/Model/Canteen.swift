/// Information about a canteen.
public struct Canteen: Codable, Identifiable, Hashable {
    public let id: Int
    public let name: String
    public let city: String
    public let address: String
    public let coordinates: Coordinates?
}
