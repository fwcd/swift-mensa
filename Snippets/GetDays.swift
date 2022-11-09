import Mensa

let client = MensaClient()

let canteenId = 1
let canteen = try await client.canteen(for: canteenId)
let days = try await client.days(for: canteenId)

print("Days for \(canteen.name):")

for day in days {
    print(day)
}
