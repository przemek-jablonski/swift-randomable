import Randomable
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
internal class LoremIpsumTestCase: XCTestCase {
  internal var randomNumberGenerator: (any RandomNumberGenerator)!

  override internal func setUp() async throws {
    self.randomNumberGenerator = try StaticRandomNumberGenerator()
  }

  override internal func tearDown() async throws {
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
  internal func generateAndCompareInstances<R: Equatable>(
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
// swiftlint:enable implicitly_unwrapped_optional
