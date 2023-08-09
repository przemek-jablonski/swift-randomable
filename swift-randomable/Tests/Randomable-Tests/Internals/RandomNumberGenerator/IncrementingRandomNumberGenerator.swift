internal class IncrementingRandomNumberGenerator {
  private var value: UInt64

  internal init(startWith value: UInt64 = 0) {
    self.value = value
  }
}

extension IncrementingRandomNumberGenerator: RandomNumberGenerator {
  internal func next() -> UInt64 {
    defer { self.value += 1 }
    return value
  }
}
