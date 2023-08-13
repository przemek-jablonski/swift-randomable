import Randomable
import XCTest

internal class RangeRandomableTestCase: XCTestCase {
  var randomNumberGenerator: (any RandomNumberGenerator)!

  override func setUp() {
    self.randomNumberGenerator = StaticRandomNumberGenerator()
  }

  override func tearDown() async throws {
    self.randomNumberGenerator = nil
  }

  internal func test_twoIntRangeInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Range<Int>.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoDoubleRangeInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Range<Double>.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoIntClosedRangeInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: ClosedRange<Int>.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoDoubleClosedRangeInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: ClosedRange<Double>.self,
      using: &randomNumberGenerator
    )
  }
}
