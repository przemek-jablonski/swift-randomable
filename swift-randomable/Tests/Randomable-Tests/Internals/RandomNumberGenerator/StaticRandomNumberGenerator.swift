internal struct StaticRandomNumberGenerator {
  private let value: UInt64

  internal init(value: UInt64 = 1) {
    assert(
      value != 0,
      """
      Using `0` as the static randomness value may result in undefined runtime behavior.
      Consider changing the `value` to non-0 or using default value in the `init`.
      """
    )
    self.value = value
  }
}

extension StaticRandomNumberGenerator: RandomNumberGenerator {
  internal func next() -> UInt64 {
    value
  }
}
