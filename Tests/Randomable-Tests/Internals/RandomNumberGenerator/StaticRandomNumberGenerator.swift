import Foundation

internal struct StaticRandomNumberGenerator {
  private let value: UInt64

  internal init(
    value: UInt64 = 1
  ) throws {
    enum StaticRandomNumberGeneratorInitializationError: LocalizedError {
      case incorrectRandomnessSeedViolation
      var errorDescription: String {
      """
      Using `0` as the static randomness value may result in undefined runtime behavior.
      Consider changing the `value` to non-0 or using default value in the `init`.
      """
      }
    }

    if value == 0 {
      throw StaticRandomNumberGeneratorInitializationError.incorrectRandomnessSeedViolation
    }
    self.value = value
  }
}

extension StaticRandomNumberGenerator: RandomNumberGenerator {
  internal func next() -> UInt64 {
    value
  }
}
