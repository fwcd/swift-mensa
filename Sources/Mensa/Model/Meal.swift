/// A meal offered by a canteen.
public struct Meal: Codable, Identifiable, Hashable {
    public let id: Int
    public let name: String
    public let prices: Prices
    public let notes: [String]
    public let category: String?

    public init(
        id: Int,
        name: String,
        prices: Prices,
        notes: [String] = [],
        category: String? = nil
    ) {
        self.id = id
        self.name = name
        self.prices = prices
        self.notes = notes
        self.category = category
    }

    public var attributes: Attributes {
        notes.map { Attributes(parsing: $0) }.reduce([]) { [$0, $1] }
    }

    /// The prices for a meal.
    public struct Prices: Codable, Hashable, CustomStringConvertible {
        public let students: Double?
        public let employees: Double?
        public let pupils: Double?
        public let others: Double?

        public var description: String {
            [students, employees, pupils, others]
                .compactMap { $0 }
                .map { String(format: "%.2f €", $0) }
                .joined(separator: " / ")
        }
    }

    /// Strongly typed attributes for a meal.
    public struct Attributes: OptionSet, RawRepresentable {
        public let rawValue: UInt64

        public static let vegetarian = Self(rawValue: 1 << 1)
        public static let vegan = Self(rawValue: 1 << 2)
        public static let lactose = Self(rawValue: 1 << 3)
        public static let beef = Self(rawValue: 1 << 4)
        public static let pork = Self(rawValue: 1 << 5)
        public static let eggs = Self(rawValue: 1 << 6)
        public static let poultry = Self(rawValue: 1 << 7)
        public static let soy = Self(rawValue: 1 << 8)
        public static let wheat = Self(rawValue: 1 << 9)
        public static let celery = Self(rawValue: 1 << 10)
        public static let mustard = Self(rawValue: 1 << 11)
        public static let peanuts = Self(rawValue: 1 << 12)
        public static let fish = Self(rawValue: 1 << 13)

        public init(rawValue: UInt64) {
            self.rawValue = rawValue
        }

        public init(parsing note: String) {
            switch note.lowercased() {
            case "vegetarisch":
                self = .vegetarian
            case "vegan":
                self = .vegan
            case "milch und laktose", "milch", "milch und milcherzeugnisse":
                self = .lactose
            case "rind", "rindfleisch":
                self = .beef
            case "schwein aus artgerechter haltung", "schwein", "schweinefleisch":
                self = .pork
            case "eier", "eier und eiererzeugnisse":
                self = .eggs
            case "geflügel":
                self = .poultry
            case "soja":
                self = .soy
            case "weizen":
                self = .wheat
            case "sellerie", "sellerie und sellerieerzeugnisse":
                self = .celery
            case "senf", "senf und senferzeugnisse":
                self = .mustard
            case "erdnüsse":
                self = .peanuts
            case "fisch":
                self = .fish
            default:
                self = []
            }
        }
    }
}
