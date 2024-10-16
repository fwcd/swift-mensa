import Foundation

/// An opening day of a canteen.
public struct Day: Codable, Hashable, Identifiable, Sendable {
    /// The YYYY-MM-DD date of this day.
    public var date: String
    /// Whether the canteen is closed that day.
    public var closed: Bool

    public var id: String { date }

    /// The parsed `Foundation.Date`.
    public var foundationDate: Date? {
        dateFormatter.date(from: date)
    }

    public init(date: String, closed: Bool) {
        self.date = date
        self.closed = closed
    }
}
