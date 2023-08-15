internal enum Constants {

  // MARK: - Constants

  /**
   The lower bounds of range used when generating sequences of random instances internally.
   */
  internal static var multipleItemsRandomRangeLowerBound: Int { 12 }

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
    1..<randomItemsCount(&randomNumberGenerator)
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

//  private static var defaultRandomItemsRange: (
//    _ randomNumberGenerator: inout RandomNumberGenerator
//  ) -> Range<Int> = { randomNumberGenerator in
//    1..<randomItemsCount(&randomNumberGenerator)
//  }

//  private static var overriddenRandomItemsRange: (
//    (_ randomNumberGenerator: inout RandomNumberGenerator) -> Range<Int>
//  )?
}

extension Constants {
  internal static func override(
    randomItemsCount: ((
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Int)?
  ) {
    Self.overriddenRandomItemsCount = randomItemsCount
  }

//  internal static func override(
//    randomItemsRange: ((
//      _ randomNumberGenerator: inout RandomNumberGenerator
//    ) -> Range<Int>)?
//  ) {
//    Self.overriddenRandomItemsRange = randomItemsRange
//  }
}
