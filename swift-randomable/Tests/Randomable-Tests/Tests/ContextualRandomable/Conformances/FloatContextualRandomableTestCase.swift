@testable import Randomable
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
internal final class FloatContextualRandomableTestCase: XCTestCase {
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

  internal func test_floatGeneratedWithPercent_0_1Hint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Float.self,
      using: &randomNumberGenerator,
      context: .percent0_1
    )

    generate(
      type: Float.self,
      using: &systemRandomNumberGenerator,
      context: .percent0_1,
      checkIfContainsIn: ContextualFloatDataSet.shared.percent0_1.map { Float($0) }
    )
  }

  internal func test_floatGeneratedWithPercent_0_100Hint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Float.self,
      using: &randomNumberGenerator,
      context: .percent0_100
    )

    generate(
      type: Float.self,
      using: &systemRandomNumberGenerator,
      context: .percent0_100,
      checkIfContainsIn: ContextualFloatDataSet.shared.percent0_100.map { Float($0) }
    )
  }

  internal func test_floatGeneratedWithPositiveHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Float.self,
      using: &randomNumberGenerator,
      context: .positive
    )

    generate(
      type: Float.self,
      using: &systemRandomNumberGenerator,
      context: .positive,
      checkIfContainsIn: ContextualFloatDataSet.shared.positive.map { Float($0) }
    )
  }

  internal func test_floatGeneratedWithNegativeHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Float.self,
      using: &randomNumberGenerator,
      context: .negative
    )

    generate(
      type: Float.self,
      using: &systemRandomNumberGenerator,
      context: .negative,
      checkIfContainsIn: ContextualFloatDataSet.shared.negative.map { Float($0) }
    )
  }

  internal func test_floatGeneratedWithSmallAmountHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Float.self,
      using: &randomNumberGenerator,
      context: .smallAmount
    )

    generate(
      type: Float.self,
      using: &systemRandomNumberGenerator,
      context: .smallAmount,
      checkIfContainsIn: ContextualFloatDataSet.shared.smallAmount.map { Float($0) }
    )
  }

  internal func test_floatGeneratedWithRegularAmountHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Float.self,
      using: &randomNumberGenerator,
      context: .regularAmount
    )

    generate(
      type: Float.self,
      using: &systemRandomNumberGenerator,
      context: .regularAmount,
      checkIfContainsIn: ContextualFloatDataSet.shared.regularAmount.map { Float($0) }
    )
  }

  internal func test_floatGeneratedWithBigAmountHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Float.self,
      using: &randomNumberGenerator,
      context: .bigAmount
    )

    generate(
      type: Float.self,
      using: &systemRandomNumberGenerator,
      context: .bigAmount,
      checkIfContainsIn: ContextualFloatDataSet.shared.bigAmount.map { Float($0) }
    )
  }

  internal func test_floatGeneratedWithExtraBigAmountHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Float.self,
      using: &randomNumberGenerator,
      context: .extraBigAmount
    )

    generate(
      type: Float.self,
      using: &systemRandomNumberGenerator,
      context: .extraBigAmount,
      checkIfContainsIn: ContextualFloatDataSet.shared.extraBigAmount.map { Float($0) }
    )
  }
}
// swiftlint:enable implicitly_unwrapped_optional
