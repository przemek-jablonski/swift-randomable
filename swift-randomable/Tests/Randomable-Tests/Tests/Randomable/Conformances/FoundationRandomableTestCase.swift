import Randomable
import XCTest

internal class FoundationRandomableTestCase: XCTestCase {
  internal var randomNumberGenerator: (any RandomNumberGenerator)!

  override internal func setUp() async throws {
    self.randomNumberGenerator = try StaticRandomNumberGenerator()
  }

  override internal func tearDown() async throws {
    self.randomNumberGenerator = nil
  }

  internal func test_twoIntInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoFloatInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Float.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoDoubleInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Double.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoStringInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoCharacterInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Character.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoDateInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Date.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoUUIDInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: UUID.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoBoolInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Bool.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoDataInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Data.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoLocaleInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Locale.self,
      using: &randomNumberGenerator
    )
  }
}
