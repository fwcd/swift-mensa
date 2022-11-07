import Mensa

let client = MensaClient()

let canteenId = 1
let canteen = try await client.canteen(for: canteenId)
let meals = try await client.meals(for: canteenId)

print("Today's meals for \(canteen.name):")

for meal in meals {
    print(meal)
}
