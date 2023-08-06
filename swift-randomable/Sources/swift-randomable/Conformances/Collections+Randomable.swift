import Foundation

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

// Collection
