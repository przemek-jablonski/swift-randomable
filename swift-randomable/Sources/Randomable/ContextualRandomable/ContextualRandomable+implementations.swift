import Foundation

// MARK: - Routing

// Default routing of the `Randomable.random()` protocol functions.
public extension ContextualRandomable {
  /**
   Generates single random instance of given type.
   Uses system's default `RandomNumberGenerator`to seed randomness.

   - Parameter context: Contextual hint that influences the generation result.
   */
  static func random(
    _ context: Context
  ) -> Self {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    return Self.random(
      context,
      &randomNumberGenerator
    )
  }
}

// Default routing of the `Randomable.randoms()` protocol functions.
public extension ContextualRandomable {
  /**
   Generates array of random instances of given type. Uses system's default `RandomNumberGenerator`to seed randomness.

   - Parameter context: Contextual hint that influences the generation result.
   */
  static func randoms(
    _ context: Context
  ) -> [Self] {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    return Self.randoms(
      context,
      &randomNumberGenerator
    )
  }
}

// MARK: - Implementations
public extension ContextualRandomable {
  /**
   Generates array of random instances of given type.
   Array's elements might not be unique.

   - Note: Array might be empty.
   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms(
    _ context: Context,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> [Self] {
    Constants
      .randomItemsRange(&randomNumberGenerator)
      .map { _ in
        Self.random(
          context,
          &randomNumberGenerator
        )
      }
  }
}

public extension ContextualRandomable where Self: Hashable {
  /**
   Generates array of random instances of given `Hashable` type.
   Array's elements will be unique from each other (unique as in `Equatable` sense,
   meaning that will be no equality between any of the array's elements).

   - Note: Array might be empty.
   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms(
    _ context: Context,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> [Self] {
    Array(
      Set(
        Constants
          .randomItemsRange(&randomNumberGenerator)
          .map { _ in
            Self.random(
              context,
              &randomNumberGenerator
            )
          }
      )
    )
  }
}

public extension ContextualRandomable where Self: Hashable & Identifiable {
  /**
   Generates array of random instances of given  `Hashable` and `Identifiable` type.
   Array's elements will be unique from each other, both in their `Equatable` values
   but also their identifiers will be unique from each other. Therefore, this is safe to use eg. in SwiftUI's `ForEach` context.

   - Note: Array might be empty.
   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms(
    _ context: Context,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> [Self] {
    var uniqueIds = Set<Self.ID>()
    return Array(
      Set(
        Constants
          .randomItemsRange(&randomNumberGenerator)
          .map { _ in
            Self.random(
              context,
              &randomNumberGenerator
            )
          }
      )
    )
    .filter { element in uniqueIds.insert(element.id).inserted }
  }
}
