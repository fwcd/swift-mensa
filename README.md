# Swift Mensa

[![Build](https://github.com/fwcd/swift-mensa/actions/workflows/build.yml/badge.svg)](https://github.com/fwcd/swift-mensa/actions/workflows/build.yml)
[![Docs](https://github.com/fwcd/swift-mensa/actions/workflows/docs.yml/badge.svg)](https://fwcd.github.io/swift-mensa/documentation/mensa)

Library for querying meal plans from German university canteens. Uses the [OpenMensa API](https://docs.openmensa.org/).

## Example

```swift
import Mensa

let client = MensaClient()
let canteens: [Canteen] = try await client.canteens()
```

See [the `Snippets` folder](Snippets) for more examples.
