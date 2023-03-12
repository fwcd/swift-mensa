/// An error from the `MensaClient`.
public enum MensaError: Error {
    case invalidUrl(String)
    case notFound
    case requestFailed(endpoint: String, code: UInt, reason: String)
}
