@testable import Randomable
import XCTest

// swiftlint:disable discouraged_optional_boolean
// swiftlint:disable implicitly_unwrapped_optional
internal class OptionalRandomableTestCase: XCTestCase {
  internal var randomNumberGenerator: (any RandomNumberGenerator)!

  override internal func setUp() {
    self.randomNumberGenerator = StaticRandomNumberGenerator()
  }

  override internal func tearDown() async throws {
    self.randomNumberGenerator = nil
  }

  internal func test_twoOptionalIntInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Int?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 0.00, &$1) }
    )

    generateAndCompareInstances(
      of: Int?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) }
    )
  }

  internal func test_twoOptionalIntInstances_generatedUsingStaticGenerator_shouldAlwaysProduceNil() {
    generateAndCompareInstances(
      of: Int?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) },
      assertions: {
        XCTAssertNil($0)
        XCTAssertNil($1)
      }
    )
  }

  internal func test_twoOptionalFloatInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Float?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 0.00, &$1) }
    )

    generateAndCompareInstances(
      of: Float?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) }
    )
  }

  internal func test_twoOptionalFloatInstances_generatedUsingStaticGenerator_shouldAlwaysProduceNil() {
    generateAndCompareInstances(
      of: Float?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) },
      assertions: {
        XCTAssertNil($0)
        XCTAssertNil($1)
      }
    )
  }

  internal func test_twoOptionalDoubleInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Double?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 0.00, &$1) }
    )

    generateAndCompareInstances(
      of: Double?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) }
    )
  }

  internal func test_twoOptionalDoubleInstances_generatedUsingStaticGenerator_shouldAlwaysProduceNil() {
    generateAndCompareInstances(
      of: Double?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) },
      assertions: {
        XCTAssertNil($0)
        XCTAssertNil($1)
      }
    )
  }

  internal func test_twoOptionalStringInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: String?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 0.00, &$1) }
    )

    generateAndCompareInstances(
      of: String?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) }
    )
  }

  internal func test_twoOptionalStringInstances_generatedUsingStaticGenerator_shouldAlwaysProduceNil() {
    generateAndCompareInstances(
      of: String?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) },
      assertions: {
        XCTAssertNil($0)
        XCTAssertNil($1)
      }
    )
  }

  internal func test_twoOptionalCharacterInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Character?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 0.00, &$1) }
    )

    generateAndCompareInstances(
      of: Character?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) }
    )
  }

  internal func test_twoOptionalCharacterInstances_generatedUsingStaticGenerator_shouldAlwaysProduceNil() {
    generateAndCompareInstances(
      of: Character?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) },
      assertions: {
        XCTAssertNil($0)
        XCTAssertNil($1)
      }
    )
  }

  internal func test_twoOptionalDateInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Date?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 0.00, &$1) }
    )

    generateAndCompareInstances(
      of: Date?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) }
    )
  }

  internal func test_twoOptionalDateInstances_generatedUsingStaticGenerator_shouldAlwaysProduceNil() {
    generateAndCompareInstances(
      of: Date?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) },
      assertions: {
        XCTAssertNil($0)
        XCTAssertNil($1)
      }
    )
  }

  internal func test_twoOptionalUUIDInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: UUID?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 0.00, &$1) }
    )

    generateAndCompareInstances(
      of: UUID?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) }
    )
  }

  internal func test_twoOptionalUUIDInstances_generatedUsingStaticGenerator_shouldAlwaysProduceNil() {
    generateAndCompareInstances(
      of: UUID?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) },
      assertions: {
        XCTAssertNil($0)
        XCTAssertNil($1)
      }
    )
  }

  internal func test_twoOptionalBoolInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Bool?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 0.00, &$1) }
    )

    generateAndCompareInstances(
      of: Bool?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) }
    )
  }

  internal func test_twoOptionalBoolInstances_generatedUsingStaticGenerator_shouldAlwaysProduceNil() {
    generateAndCompareInstances(
      of: Bool?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) },
      assertions: {
        XCTAssertNil($0)
        XCTAssertNil($1)
      }
    )
  }

  internal func test_twoOptionalDataInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Data?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 0.00, &$1) }
    )

    generateAndCompareInstances(
      of: Data?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) }
    )
  }

  internal func test_twoOptionalDataInstances_generatedUsingStaticGenerator_shouldAlwaysProduceNil() {
    generateAndCompareInstances(
      of: Data?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) },
      assertions: {
        XCTAssertNil($0)
        XCTAssertNil($1)
      }
    )
  }

  internal func test_twoOptionalLocaleInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Locale?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 0.00, &$1) }
    )

    generateAndCompareInstances(
      of: Locale?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) }
    )
  }

  internal func test_twoOptionalLocaleInstances_generatedUsingStaticGenerator_shouldAlwaysProduceNil() {
    generateAndCompareInstances(
      of: Locale?.self,
      using: &randomNumberGenerator,
      generation: { $0.random(nilToValueRatio: 1.00, &$1) },
      assertions: {
        XCTAssertNil($0)
        XCTAssertNil($1)
      }
    )
  }
}
// swiftlint:enable discouraged_optional_boolean
// swiftlint:enable implicitly_unwrapped_optional
