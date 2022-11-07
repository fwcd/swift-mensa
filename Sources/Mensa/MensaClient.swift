import AsyncHTTPClient
import Foundation
import NIO

/// A facility for querying meal plans.
public struct MensaClient {
    private static let apiHost: String = "openmensa.org"
    private static let apiBasePath: String = "/api/v2/"

    private let httpClient: HTTPClient
    private let timeout: TimeAmount

    /// Creates a new `MensaClient` with the given event loop group.
    ///
    /// Note that not passing an event loop group may cause Swift NIO
    /// to spawn new threads, which is comparatively expensive, therefore
    /// such `MensaClient`s should generally be long-lived.
    ///
    /// - Parameters:
    ///   - eventLoopGroup: The NIO event loop group to use
    ///   - timeout: The request timeout duration
    public init(eventLoopGroup: EventLoopGroup? = nil, timeout: TimeAmount = .seconds(10)) {
        httpClient = HTTPClient(eventLoopGroupProvider: eventLoopGroup.map { .shared($0) } ?? .createNew)
        self.timeout = timeout
    }

    /// Queries canteens.
    /// 
    /// Since these aren't expected to change frequently,
    /// clients are encouraged to cache the results.
    /// 
    /// - Parameters:
    ///   - coordinates: Center point around which to search
    ///   - distance: Radius around the center for the search
    /// - Returns: The matching canteens
    public func canteens(near coordinates: Coordinates? = nil, distance: Double? = nil) async throws -> [Canteen] {
        return try await get(endpoint: "/canteens", query: [
            coordinates.map { [("near[lat]", String($0.latitude)), ("near[lon]", String($0.longitude))] } ?? [],
            distance.map { [("near[dist]", String($0))] } ?? [],
        ].flatMap { $0 })
    }

    private func get<T>(endpoint: String, query: [(String, String)] = []) async throws -> T where T: Decodable {
        var components = URLComponents()
        components.scheme = "https"
        components.host = Self.apiHost
        components.path = "\(Self.apiBasePath)\(endpoint)"
        components.queryItems = query.map { URLQueryItem(name: $0.0, value: $0.1) }

        guard let url = components.url else {
            throw MensaError.invalidUrl("Could not encode URL for endpoint \(endpoint)")
        }

        let request = HTTPClientRequest(url: url.absoluteString)
        let response = try await httpClient.execute(request, timeout: timeout)
        let body = try await response.body.collect(upTo: 1024 * 1024) // 1 MB
        let result = try JSONDecoder().decode(T.self, from: body)
        return result
    }
}
