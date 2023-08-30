import XCTest

internal class StaticRandomNumberGeneratorTestCase: XCTestCase {
  internal func test_randomizingIntValues_alwaysProducesTheSameValue() throws {
    var randomNumberGenerator = try StaticRandomNumberGenerator()

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

  internal func test_randomizingFloatValues_alwaysProducesTheSameValue() throws {
    var randomNumberGenerator = try StaticRandomNumberGenerator()

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

  internal func test_randomizingDoubleValues_alwaysProducesTheSameValue() throws {
    var randomNumberGenerator = try StaticRandomNumberGenerator()

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

  internal func test_randomizingBoolValues_alwaysProducesTheSameValue() throws {
    var randomNumberGenerator = try StaticRandomNumberGenerator()

    XCTAssertEqual(
      Bool.random(using: &randomNumberGenerator),
      Bool.random(using: &randomNumberGenerator)
    )
  }

  internal func test_generatorBeingPassed0AsStartingValue_willCrashOnStartup() {
    XCTAssertThrowsError(try StaticRandomNumberGenerator(value: 0))
  }

  internal func test_generatorBeingPassed1AsStartingValue_willNotCrashOnStartup() throws {
    XCTAssertNoThrow(try StaticRandomNumberGenerator(value: 1))
  }

  internal func test_generatorStartingWith1_alwaysReturnsStartingValue() throws {
    let startingValue = UInt64(1)
    let randomNumberGenerator = try StaticRandomNumberGenerator(value: startingValue)
    XCTAssertTrue(
      (0..<10)
      .map { _ in randomNumberGenerator.next() }
      .allSatisfy { uInt in
        uInt == startingValue
      }
    )
  }

  internal func test_generatorStartingWithNon1_alwaysReturnsStartingValue() throws {
    let startingValue = UInt64(21370000)
    let randomNumberGenerator = try StaticRandomNumberGenerator(value: startingValue)
    XCTAssertTrue(
      (0..<10)
        .map { _ in randomNumberGenerator.next() }
        .allSatisfy { uInt in
          uInt == startingValue
        }
    )
  }
}
