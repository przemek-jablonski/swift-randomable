import Foundation

extension Optional: Randomable where Wrapped: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    random(
      nilToValueRatio: 0.25,
      &randomNumberGenerator
    )
  }

  /**
   Generates single random instance of given Optional type. You can specify

   - Parameter nilToValueRatio: Object responsible for randomness seed.
   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  internal static func random(
    nilToValueRatio: Double,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    if Double.random(
      in: 0...1,
      using: &randomNumberGenerator
    ) > nilToValueRatio {
      return Wrapped.random(&randomNumberGenerator)
    } else {
      return nil
    }
  }
}
