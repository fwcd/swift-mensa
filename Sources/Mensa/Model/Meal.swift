/// A meal offered by a canteen.
public struct Meal: Codable, Identifiable, Hashable {
    public let id: Int
    public let name: String
    public let notes: [String]
    public let prices: Prices
    public let category: String?

    /// The prices for a meal.
    public struct Prices: Codable, Hashable {
        public let students: Double?
        public let employees: Double?
        public let pupils: Double?
        public let others: Double?
    }
}
