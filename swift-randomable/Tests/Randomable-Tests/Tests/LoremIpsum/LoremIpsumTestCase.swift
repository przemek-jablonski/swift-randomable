import Randomable
import XCTest

internal class LoremIpsumTestCase: XCTestCase {
  var randomNumberGenerator: (any RandomNumberGenerator)!

  override func setUp() {
    self.randomNumberGenerator = StaticRandomNumberGenerator()
  }

  override func tearDown() async throws {
    self.randomNumberGenerator = nil
  }

  internal func test_twoRandomLoremIpsums_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: LoremIpsum.random(_:),
      using: &randomNumberGenerator
    )
  }

  internal func test_twoSingleWordLoremIpsum_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: LoremIpsum.singleWord(_:),
      using: &randomNumberGenerator
    )
  }

  internal func test_twoShortLoremIpsum_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: LoremIpsum.short(_:),
      using: &randomNumberGenerator
    )
  }

  internal func test_twoRegularLoremIpsum_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: LoremIpsum.regular(_:),
      using: &randomNumberGenerator
    )
  }

  internal func test_twoLongLoremIpsum_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: LoremIpsum.long(_:),
      using: &randomNumberGenerator
    )
  }

  internal func test_twoExtraLongLoremIpsum_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: LoremIpsum.extraLong(_:),
      using: &randomNumberGenerator
    )
  }

  internal func test_twoExtraExtraLongLoremIpsum_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: LoremIpsum.extraExtraLong(_:),
      using: &randomNumberGenerator
    )
  }
}

extension XCTestCase {
  func generateAndCompareInstances<R: Equatable>(
    of instance: (inout any RandomNumberGenerator) -> R,
    using randomNumberGenerator: inout any RandomNumberGenerator,
    assertions: (_ instance1: R, _ instance2: R) -> () = { XCTAssertEqual($0, $1) }
  ) {
    XCTAssertEqual(
      instance(&randomNumberGenerator),
      instance(&randomNumberGenerator)
    )
  }
}
