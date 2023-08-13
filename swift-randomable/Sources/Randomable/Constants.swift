internal struct Constants {

  // MARK: - Constants

  /**
   The lower bounds of range used when generating sequences of random instances internally.
   */
  internal static var multipleItemsRandomRangeLowerBound: Int { 1 }

  /**
   The upper bounds of range used when generating sequences of random instances internally.
   */
  internal static var multipleItemsRandomRangeUpperBound: Int { 20 }

  /**
   Total count of items to use when generating sequences of random instances internally.
   */
  internal static func randomItemsCount(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Int {
    overriddenRandomItemsCount?(&randomNumberGenerator) ?? defaultRandomItemsCount(&randomNumberGenerator)
  }

  /**
   Range used when generating sequences of random instances internally.
   */
  internal static func randomItemsRange(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Range<Int> {
    overriddenRandomItemsRange?(&randomNumberGenerator) ?? defaultRandomItemsRange(&randomNumberGenerator)
  }

  // MARK: - Overridables

  private static var defaultRandomItemsCount: (
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Int = { randomNumberGenerator in
    (multipleItemsRandomRangeLowerBound ..< multipleItemsRandomRangeUpperBound)
      .randomElement(using: &randomNumberGenerator) ?? multipleItemsRandomRangeLowerBound
  }

  private static var overriddenRandomItemsCount: (
    (_ randomNumberGenerator: inout RandomNumberGenerator) -> Int
  )?

  private static var defaultRandomItemsRange: (
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Range<Int> = { randomNumberGenerator in
    (0..<randomItemsCount(&randomNumberGenerator))
  }

  private static var overriddenRandomItemsRange: (
    (_ randomNumberGenerator: inout RandomNumberGenerator) -> Range<Int>
  )?
}

extension Constants {
  static func override(
    randomItemsCount: ((
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Int)?
  ) {
    Self.overriddenRandomItemsCount = randomItemsCount
  }

  static func override(
    randomItemsRange: ((
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Range<Int>)?
  ) {
    Self.overriddenRandomItemsRange = randomItemsRange
  }
}
