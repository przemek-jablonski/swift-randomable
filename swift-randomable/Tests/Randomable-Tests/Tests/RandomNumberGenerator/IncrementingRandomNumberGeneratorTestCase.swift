import XCTest

internal class IncrementingRandomNumberGeneratorTestCase: XCTestCase {
  internal func test_generatorStartingWithDefault0Value_alwaysReturnsUniqueIncrementedValue() {
    let randomNumberGenerator = IncrementingRandomNumberGenerator()
    XCTAssertEqual(
      (0..<10).map { _ in randomNumberGenerator.next() },
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    )
  }

  internal func test_generatorStartingWithNonDefaultValue_alwaysReturnsUniqueIncrementedValue() {
    let startingValue = UInt64(1000)
    let randomNumberGenerator = IncrementingRandomNumberGenerator(startWith: startingValue)
    XCTAssertEqual(
      (0..<10).map { _ in randomNumberGenerator.next() },
      [1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009]
    )
  }
}
