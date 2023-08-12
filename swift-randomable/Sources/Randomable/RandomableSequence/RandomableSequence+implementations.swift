import Foundation

// MARK: - Routing

// Default routing of the `RandomableSequence.random()` protocol functions.
public extension RandomableSequence {
  static func random() -> any Sequence {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    return Self.random(&randomNumberGenerator)
  }
}

// MARK: - Private

private let multipleItemsRandomRangeLowerBound = 1
private let multipleItemsRandomRangeUpperBound = 20
private func randomItemsRange(_ randomNumberGenerator: inout RandomNumberGenerator) -> Range<Int> {
  0 ..< ((multipleItemsRandomRangeLowerBound..<multipleItemsRandomRangeUpperBound).randomElement(using: &randomNumberGenerator) ?? 1)
}

// MARK: - Implementations

// Default implementations of the `RandomableSequence.random()` protocol functions.
public extension RandomableSequence {
  static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> any Sequence {
    randomItemsRange(&randomNumberGenerator).map { _ in
      Self.Element.random(&randomNumberGenerator)
    }
  }
}

// TODO: check if this will execute appropriate random method
// TODO: (eg. if Element == Identifiable, then it should fire the `Randomable where Self: Hashable & Identifiable` random).
