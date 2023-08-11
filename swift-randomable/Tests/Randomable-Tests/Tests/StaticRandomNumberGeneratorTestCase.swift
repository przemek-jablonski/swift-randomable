import XCTest

internal class StaticRandomNumberGeneratorTestCase: XCTestCase {
  internal func test_randomizingIntValues_alwaysProducesTheSameValue() {
    var randomNumberGenerator = StaticRandomNumberGenerator()

    XCTAssertEqual(
      Int.random(in: 0..<1, using: &randomNumberGenerator),
      Int.random(in: 0..<1, using: &randomNumberGenerator)
    )

    XCTAssertEqual(
      Int.random(in: 0..<100_000_000, using: &randomNumberGenerator),
      Int.random(in: 0..<100_000_000, using: &randomNumberGenerator)
    )

    XCTAssertEqual(
      Int.random(in: 0..<100_000_000_000, using: &randomNumberGenerator),
      Int.random(in: 0..<100_000_000_000, using: &randomNumberGenerator)
    )
  }

  internal func test_randomizingFloatValues_alwaysProducesTheSameValue() {
    var randomNumberGenerator = StaticRandomNumberGenerator()

    XCTAssertEqual(
      Float.random(in: 0..<1, using: &randomNumberGenerator),
      Float.random(in: 0..<1, using: &randomNumberGenerator)
    )

    XCTAssertEqual(
      Float.random(in: 0..<100_000_000, using: &randomNumberGenerator),
      Float.random(in: 0..<100_000_000, using: &randomNumberGenerator)
    )

    XCTAssertEqual(
      Float.random(in: 0..<100_000_000_00, using: &randomNumberGenerator),
      Float.random(in: 0..<100_000_000_00, using: &randomNumberGenerator)
    )
  }

  internal func test_randomizingDoubleValues_alwaysProducesTheSameValue() {
    var randomNumberGenerator = StaticRandomNumberGenerator()

    XCTAssertEqual(
      Double.random(in: 0..<1, using: &randomNumberGenerator),
      Double.random(in: 0..<1, using: &randomNumberGenerator)
    )

    XCTAssertEqual(
      Double.random(in: 0..<100_000_000, using: &randomNumberGenerator),
      Double.random(in: 0..<100_000_000, using: &randomNumberGenerator)
    )

    XCTAssertEqual(
      Double.random(in: 0..<100_000_000_000, using: &randomNumberGenerator),
      Double.random(in: 0..<100_000_000_000, using: &randomNumberGenerator)
    )
  }

  internal func test_randomizingBoolValues_alwaysProducesTheSameValue() {
    var randomNumberGenerator = StaticRandomNumberGenerator()

    XCTAssertEqual(
      Bool.random(using: &randomNumberGenerator),
      Bool.random(using: &randomNumberGenerator)
    )
  }
}
