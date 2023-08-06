import Foundation

extension Optional: Randomable where Wrapped: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    let nilToValueRatio = 0.33
    return random(
      nilToValueRatio,
      &randomNumberGenerator
    )
  }

  internal static func random(
    _ nilToValueRatio: Double,
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
