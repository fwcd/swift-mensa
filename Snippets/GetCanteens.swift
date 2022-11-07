import Mensa

let client = MensaClient()
let canteens = try await client.canteens()

for canteen in canteens {
    print(canteen)
}
