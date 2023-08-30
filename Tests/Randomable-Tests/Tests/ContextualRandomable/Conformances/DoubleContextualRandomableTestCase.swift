@testable import Randomable
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
internal final class DoubleContextualRandomableTestCase: XCTestCase {
  internal var randomNumberGenerator: (any RandomNumberGenerator)!
  internal var systemRandomNumberGenerator: (any RandomNumberGenerator)!

  override internal func setUp() async throws {
    self.randomNumberGenerator = try StaticRandomNumberGenerator()
    self.systemRandomNumberGenerator = SystemRandomNumberGenerator()
  }

  override internal func tearDown() async throws {
    self.randomNumberGenerator = nil
    self.systemRandomNumberGenerator = nil
  }

  internal func test_doubleGeneratedWithPercent_0_1Hint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Double.self,
      using: &randomNumberGenerator,
      context: .percent0_1
    )

    generate(
      type: Double.self,
      using: &systemRandomNumberGenerator,
      context: .percent0_1,
      checkIfContainsIn: ContextualFloatDataSet.shared.percent0_1
    )
  }

  internal func test_doubleGeneratedWithPercent_0_100Hint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Double.self,
      using: &randomNumberGenerator,
      context: .percent0_100
    )

    generate(
      type: Double.self,
      using: &systemRandomNumberGenerator,
      context: .percent0_100,
      checkIfContainsIn: ContextualFloatDataSet.shared.percent0_100
    )
  }

  internal func test_doubleGeneratedWithPositiveHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Double.self,
      using: &randomNumberGenerator,
      context: .positive
    )

    generate(
      type: Double.self,
      using: &systemRandomNumberGenerator,
      context: .positive,
      checkIfContainsIn: ContextualFloatDataSet.shared.positive
    )
  }

  internal func test_doubleGeneratedWithNegativeHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Double.self,
      using: &randomNumberGenerator,
      context: .negative
    )

    generate(
      type: Double.self,
      using: &systemRandomNumberGenerator,
      context: .negative,
      checkIfContainsIn: ContextualFloatDataSet.shared.negative
    )
  }

  internal func test_doubleGeneratedWithSmallAmountHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Double.self,
      using: &randomNumberGenerator,
      context: .smallAmount
    )

    generate(
      type: Double.self,
      using: &systemRandomNumberGenerator,
      context: .smallAmount,
      checkIfContainsIn: ContextualFloatDataSet.shared.smallAmount
    )
  }

  internal func test_doubleGeneratedWithRegularAmountHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Double.self,
      using: &randomNumberGenerator,
      context: .regularAmount
    )

    generate(
      type: Double.self,
      using: &systemRandomNumberGenerator,
      context: .regularAmount,
      checkIfContainsIn: ContextualFloatDataSet.shared.regularAmount
    )
  }

  internal func test_doubleGeneratedWithBigAmountHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Double.self,
      using: &randomNumberGenerator,
      context: .bigAmount
    )

    generate(
      type: Double.self,
      using: &systemRandomNumberGenerator,
      context: .bigAmount,
      checkIfContainsIn: ContextualFloatDataSet.shared.bigAmount
    )
  }

  internal func test_doubleGeneratedWithExtraBigAmountHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Double.self,
      using: &randomNumberGenerator,
      context: .extraBigAmount
    )

    generate(
      type: Double.self,
      using: &systemRandomNumberGenerator,
      context: .extraBigAmount,
      checkIfContainsIn: ContextualFloatDataSet.shared.extraBigAmount
    )
  }
}
// swiftlint:enable implicitly_unwrapped_optional
