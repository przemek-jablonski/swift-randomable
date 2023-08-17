import Foundation

extension Int: Randomable {
  public static func random(
    _ randomNumberGenerator: inout any RandomNumberGenerator
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
    LoremIpsum.random(&randomNumberGenerator)
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

private let arbitraryUnixTimestamp = 1691593427.00
extension Date: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Date(
      timeIntervalSince1970:
        Double.random(
          in: 0.00...arbitraryUnixTimestamp,
          using: &randomNumberGenerator
        )
    )
  }
}

extension UUID: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    UUID(
      uuid: (
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator)),
        UInt8(Int.random(&randomNumberGenerator))
      )
    )
  }
}

extension Bool: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    .random(using: &randomNumberGenerator)
  }
}

extension Data: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Data(
      repeating: UInt8(Int.random(&randomNumberGenerator)),
      count: (0...10000).randomElement(using: &randomNumberGenerator) ?? 0
    )
  }
}

extension Locale: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    // swiftlint:disable force_unwrapping
    Locale(
      identifier:
        Locale.availableIdentifiers.randomElement(
          using: &randomNumberGenerator
        )!
    )
    // swiftlint:enable force_unwrapping
  }
}

extension URL: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> URL {
    // swiftlint:disable force_unwrapping
    URL(string: [
      "https://google.com",
      "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
      "https://picsum.photos/id/870/200/300?grayscale&blur=2",
      "https://i.redd.it/vwlgciqshjp41.jpg",
      "https://en.wikipedia.org/wiki/Lorem_ipsum"
    ].randomElement(using: &randomNumberGenerator)!
    )!
    // swiftlint:enable force_unwrapping
  }
}
