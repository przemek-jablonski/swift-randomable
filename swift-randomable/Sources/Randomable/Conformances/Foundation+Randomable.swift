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

private let oneYearTimestamp = 31536000
extension Date: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    let currentTimestamp = Date().timeIntervalSince1970
    let lowerRandomBoundMultiplier = -2
    let upperRandomBoundMultiplier = 0.2
    return Date(
      timeIntervalSince1970:
        Double.random(
          in:
            (currentTimestamp + Double(oneYearTimestamp) * Double(lowerRandomBoundMultiplier)) ..<
          (currentTimestamp + Double(oneYearTimestamp) * Double(upperRandomBoundMultiplier)),
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

// swiftlint:disable no_magic_numbers
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
// swiftlint:enable no_magic_numbers

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