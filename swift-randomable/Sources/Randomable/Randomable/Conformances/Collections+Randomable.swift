import Foundation

extension Array: Randomable where Element: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Constants
      .randomItemsRange(&randomNumberGenerator)
      .map { _ in .random(&randomNumberGenerator) }
  }
}

extension Dictionary: Randomable where Key: Randomable & Hashable, Value: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Dictionary(
      uniqueKeysWithValues:
        Set(
          Constants
            .randomItemsRange(&randomNumberGenerator)
            .map { _ in
              Key.random(&randomNumberGenerator)
            }
        ).map { key in
          Dictionary.Element(key, .random(&randomNumberGenerator))
        }
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

extension Set: Randomable where Element: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Set(
//      Constants
//        .randomItemsRange(&randomNumberGenerator)
//        .map { _ in .random(&randomNumberGenerator) }
    )
  }
}

extension Substring: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Substring(
      Constants
        .randomItemsRange(&randomNumberGenerator)
        .map { _ in .random(&randomNumberGenerator) }
    )
  }
}
