import Foundation

// MARK: - Foundation support
extension Int: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    .random(
      in: Int.min...Int.max,
      using: &randomNumberGenerator
    )
  }
}

extension Float: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    .random(
      in: Float(Int.min)...Float(Int.max),
      using: &randomNumberGenerator
    )
  }
}

extension Double: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    .random(
      in: Double(Int.min)...Double(Int.max),
      using: &randomNumberGenerator
    )
  }
}

extension String: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    LoremIpsum.random
  }
}

extension Character: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    String.random(
      &randomNumberGenerator
    )
    .randomElement(using: &randomNumberGenerator) ?? "a"
  }
}

private let oneYearTimeInterval = 31536000
extension Date: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    return Date(timeIntervalSince1970:
                  Double.random(
                    in:
                      Date().timeIntervalSince1970 - oneYearTimeInterval * 2 ..<
                    Date().timeIntervalSince1970 + oneYearTimeInterval * 0.2,
                    using: &randomNumberGenerator
                  )
    )
  }
}

extension UUID: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    UUID()
  }
}

extension Bool: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    .random(using: &randomNumberGenerator)
  }
}

// MARK: - Additional types support
extension URL: Randomable {
  // swiftlint:disable force_unwrapping
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> URL {
    URL(string: [
      "https://google.com",
      "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
      "https://picsum.photos/id/870/200/300?grayscale&blur=2",
      "https://i.redd.it/vwlgciqshjp41.jpg",
      "https://en.wikipedia.org/wiki/Lorem_ipsum"
    ].random()
    )!
  }
  // swiftlint:enable force_unwrapping
}

extension Data: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Data {
    Data(
      repeating: UInt8(Int.random(&randomNumberGenerator)),
      count: (0...10000).randomElement() ?? 0
    )
  }
}

// MARK: - Optionals support
extension Optional: Randomable where Wrapped: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    random(
      nilToValueRatio: 0.33,
      &randomNumberGenerator
    )
  }
  
  internal static func random(
    nilToValueRatio: Float,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    if Float.random(
      in: 0...1,
      using: &randomNumberGenerator
    ) > nilToValueRatio {
      return Wrapped.random(&randomNumberGenerator)
    } else {
      return nil
    }
  }
}

// MARK: - Collections support
extension Array: Randomable where Element: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Element.randoms(&randomNumberGenerator)
  }
}

extension Set: Randomable where Element: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Set(Element.randoms(&randomNumberGenerator))
  }
}

extension Dictionary: Randomable where Key: Randomable, Value: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {Dictionary(
    uniqueKeysWithValues: zip(
      Set(Key.randoms(&randomNumberGenerator)),
      Value.randoms(&randomNumberGenerator)
    )
  )
  }
}

extension Range: Randomable where Bound: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    let boundA = Bound.random(&randomNumberGenerator)
    let boundB = Bound.random(&randomNumberGenerator)
    return Swift.min(boundA, boundB)..<Swift.max(boundA, boundB)
  }
}

extension ClosedRange: Randomable where Bound: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    let boundA = Bound.random(&randomNumberGenerator)
    let boundB = Bound.random(&randomNumberGenerator)
    return Swift.min(boundA, boundB)...Swift.max(boundA, boundB)
  }
}

extension Locale: Randomable {
  // swiftlint:disable force_unwrapping
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Locale {
    Locale(
      identifier:
        Locale.availableIdentifiers.randomElement(
          using: &randomNumberGenerator
        )!
    )
  }
  // swiftlint:enable force_unwrapping
}
