import Foundation

// TODO: add StringGenerationSuggestion like random(.fileName), random(.user) or something

// MARK: - Routing

// Default routing of the `Randomable.random()` protocol functions.
public extension Randomable {
  static func random() -> Self {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    return Self.random(&randomNumberGenerator)
  }

  func random() -> Self { Self.random() }
}

// Default routing of the `Randomable.randoms()` protocol functions.
public extension Randomable {
  static func randoms() -> [Self] {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    return Self.randoms(&randomNumberGenerator)
  }
}

// MARK: - Implementations

// Default implementations of the `Randomable.randoms(:)` protocol functions.
public extension Randomable {
  /**
   Generates array of random instances of given type.
   Array's elements might not be unique.

   - Note: Array might be empty.
   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> [Self] {
    Constants
      .randomItemsRange(&randomNumberGenerator)
      .map { _ in
        Self.random(&randomNumberGenerator)
      } // TODO: THIS WAS UNTESTED!!!!!
  }
}

public extension Randomable where Self: Hashable {
  /**
   Generates array of random instances of given `Hashable` type.
   Array's elements will be unique from each other (unique as in `Equatable` sense,
   meaning that will be no equality between any of the array's elements).

   - Note: Array might be empty.
   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> [Self] {
    Array(
      Set(
        Constants
          .randomItemsRange(&randomNumberGenerator)
          .map { _ in
            Self.random(&randomNumberGenerator)
          }
      )
    )
  }
}

public extension Randomable where Self: Hashable & Identifiable {
  /**
   Generates array of random instances of given  `Hashable` and `Identifiable` type.
   Array's elements will be unique from each other, both in their `Equatable` values
   but also their identifiers will be unique from each other. Therefore, this is safe to use eg. in SwiftUI's `ForEach` context.

   - Note: Array might be empty.
   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> [Self] {
    var uniqueIds = Set<Self.ID>()
    return Array(
      Set(
        Constants
          .randomItemsRange(&randomNumberGenerator).map { _ in
          Self.random(&randomNumberGenerator)
        }))
    .filter { element in
      uniqueIds.insert(element.id).inserted
    }
  }
}
