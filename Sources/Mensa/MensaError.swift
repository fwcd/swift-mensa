/// An error from the `MensaClient`.
public enum MensaError: Error {
    case invalidUrl(String)
    case requestFailed(endpoint: String, code: UInt, reason: String)
}
