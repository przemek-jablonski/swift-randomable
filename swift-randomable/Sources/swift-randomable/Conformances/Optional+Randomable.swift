import Foundation

extension Optional: Randomable where Wrapped: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    random(
      nilToValueRatio: 0.33,
      &randomNumberGenerator
    )
  }

  internal static func random(
    nilToValueRatio: Float,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    if Float.random(
      in: 0...1,
      using: &randomNumberGenerator
    ) > nilToValueRatio {
      return Wrapped.random(&randomNumberGenerator)
    } else {
      return nil
    }
  }
}
