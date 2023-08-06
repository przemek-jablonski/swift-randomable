import Foundation

extension Range: Randomable where Bound: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    let boundA = Bound.random(&randomNumberGenerator)
    let boundB = Bound.random(&randomNumberGenerator)
    return Swift.min(boundA, boundB)..<Swift.max(boundA, boundB)
  }
}

extension ClosedRange: Randomable where Bound: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    let boundA = Bound.random(&randomNumberGenerator)
    let boundB = Bound.random(&randomNumberGenerator)
    return Swift.min(boundA, boundB)...Swift.max(boundA, boundB)
  }
}
