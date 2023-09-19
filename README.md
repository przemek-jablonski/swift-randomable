# swift-randomable
Randomization tools for your Swift models.

✅ Unified and testable randomness API

✅ Support for standard `Foundation` and non-`Foundation` types

✅ All Apple platforms (iOS, macOS, watchOS, tvOS, visionOS) 

#### Features:
- Generate **single** random values with standardized `.random()` API.
```swift
// Foundation types
Double.random()
Date.random()
UUID.random()
URL.random()

// Works with Optionals
Int?.random()
Bool?.random()

// Collections and Ranges
[Int].random()
ClosedRange<Float>.random()
[String: Double].random()

// Supports MapKit 
MKCoordinateRegion.random()

// And other frameworks like CoreLocation
CLLocationCoordinate2D.random()
```

- Generate **multiple** random values with standardized `.randoms()` API.
```swift
// Foundation types
Int.randoms() // -> [Int]
Bool.randoms() // -> [Bool]

// Supports all Collections, not only Arrays
Array<Data>.randoms() // -> [[Data]
Set<Locale>.randoms() // -> [Set<Locale>]
```

- Generate **human readable**, **context-aware** randomables using `ContextualRandomable` protocol.
```swift
Int.random(.percent0_100) // 0, 10, 25, 33, 50, 95, 99, 100
Double.random(.positive) // 2.00, 0.0001, 12.420001, 21.37, 9999999.99

String.random(.firstName) // "James", "Olivia", "Charlotte"
String.random(.businessTitle) // "Contractor", "President", "Intern"
String.random(.language) // "English", "Spanish", "French"

String.random(.tag) // "#travel", "#tech"
String.random(.permission) // "user", "moderator", "triage"
```

- All implementations made testable using `inout RandomNumberGenerator`
```swift
// Swift's default `SystemRandomNumberGenerator` is used by default
String.random()

// Can be overriden with custom one for testing purposes
String.random(&StaticRandomNumberGenerator()) 

// Works with context hints as well
String.random(.businessTitle, &TestSpecificRandomNumberGenerator())
```

- Add randomization to the models that you own:
```swift
struct TestModelA { /* ... */ }

extension TestModelA: Randomable {
    static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
        // Generate random TestModel properties using simple .random() API,
        // thus making the entire struct `Randomable`.
        self.init(
            id: .random(),
            userName: .random(),
            userLevel: .random(),
            userPermissionsArray: .random(),
            optionalItemIdentifier: .random()
        )
    }
}

struct TestModelB { /* ... */ }

extension TestModelB: Randomable {
    static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
        // If strict test equality is needed, pass the `randomNumberGenerator` down.
        self.init(
            elementIdentifier: .random(&randomNumberGenerator),
            elementInventoryState: .random(&randomNumberGenerator),
            elementNextUpdate: .random(&randomNumberGenerator)
        )
    }
}
```

#### Installation (Swift Package Manager):

Add the `swift-randomable` as your package dependency:
```swift
let package = Package(
    // ...
    dependencies: [
      .package(url: "https://github.com/przemek-jablonski/swift-randomable", exact: "1.0.0")
    ],
    ...
)
```
