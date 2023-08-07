import Foundation

// TODO: add StringGenerationSuggestion like random(.fileName), random(.user) or something

// Default routing of the `Randomable.random()` protocol functions.
public extension Randomable {
  /**
   Generates single random instance of given type.

   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func random() -> Self {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    return Self.random(&randomNumberGenerator)
  }

  /**
   Generates single random instance of given type.

   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  func random() -> Self { Self.random() }
}

// Default routing of the `Randomable.randoms()` protocol functions.
public extension Randomable {
  /**
   Generates array of random instances of given type.

   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms() -> [Self] {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    return Self.randoms(&randomNumberGenerator)
  }
}

private let multipleItemsRandomRangeLowerBound = 1
private let multipleItemsRandomRangeUpperBound = 20
private func randomItemsRange(_ randomNumberGenerator: inout RandomNumberGenerator) -> Range<Int> {
  0 ..< ((multipleItemsRandomRangeLowerBound..<multipleItemsRandomRangeUpperBound).randomElement(using: &randomNumberGenerator) ?? 1)
}

// Default implementations of the `Randomable.randoms()` protocol functions.
public extension Randomable {
  /**
   Generates array of random instances of given type.

   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> [Self] {
    randomItemsRange(&randomNumberGenerator).map { _ in Self.random() }
  }
}

public extension Randomable where Self: Hashable {
  /**
   Generates array of random instances of given `Hashable` type.

   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> [Self] {
    Array(Set(randomItemsRange(&randomNumberGenerator).map { _ in Self.random() }))
  }
}

public extension Randomable where Self: Hashable & Identifiable {
  /**
   Generates array of random instances of given  `Hashable` and `Identifiable` type.

   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> [Self] {
    var uniqueIds = Set<Self.ID>()

    return Array(Set(randomItemsRange(&randomNumberGenerator).map { _ in Self.random() }))
      .filter { element in uniqueIds.insert(element.id).inserted }
  }
}
