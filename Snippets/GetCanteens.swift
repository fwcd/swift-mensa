import Mensa

let client = MensaClient()

let center = Coordinates(latitude: 50.1259, longitude: 8.6656)
let radius = 5.0 // km
let canteens = try await client.canteens(near: center, radius: radius)

print("Canteens in a \(radius) km radius around \(center):")

for canteen in canteens {
    print(canteen)
}
