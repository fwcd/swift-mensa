import Foundation

/// The YYYY-MM-DD date formatter for dates used throughout the API.
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()
