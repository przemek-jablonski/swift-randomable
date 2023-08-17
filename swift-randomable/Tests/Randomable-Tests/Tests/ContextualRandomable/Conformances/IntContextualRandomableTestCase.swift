@testable import Randomable
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
internal final class IntContextualRandomableTestCase: XCTestCase {
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

  internal func test_intGeneratedWithPercent_0_100Hint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator,
      context: .percent0_100
    )

    generate(
      type: Int.self,
      using: &systemRandomNumberGenerator,
      context: .percent0_100,
      checkIfContainsIn: ContextualIntDataSet.shared.percent0_100
    )
  }

  internal func test_intGeneratedWithPositiveHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator,
      context: .positive
    )

    generate(
      type: Int.self,
      using: &systemRandomNumberGenerator,
      context: .positive,
      checkIfContainsIn: ContextualIntDataSet.shared.positive
    )
  }

  internal func test_intGeneratedWithNegativeHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator,
      context: .negative
    )

    generate(
      type: Int.self,
      using: &systemRandomNumberGenerator,
      context: .negative,
      checkIfContainsIn: ContextualIntDataSet.shared.negative
    )
  }

  internal func test_intGeneratedWithSmallAmountHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator,
      context: .smallAmount
    )

    generate(
      type: Int.self,
      using: &systemRandomNumberGenerator,
      context: .smallAmount,
      checkIfContainsIn: ContextualIntDataSet.shared.smallAmount
    )
  }

  internal func test_intGeneratedWithRegularAmountHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator,
      context: .regularAmount
    )

    generate(
      type: Int.self,
      using: &systemRandomNumberGenerator,
      context: .regularAmount,
      checkIfContainsIn: ContextualIntDataSet.shared.regularAmount
    )
  }

  internal func test_intGeneratedWithBigAmountHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator,
      context: .bigAmount
    )

    generate(
      type: Int.self,
      using: &systemRandomNumberGenerator,
      context: .bigAmount,
      checkIfContainsIn: ContextualIntDataSet.shared.bigAmount
    )
  }

  internal func test_intGeneratedWithExtraBigAmountHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator,
      context: .extraBigAmount
    )

    generate(
      type: Int.self,
      using: &systemRandomNumberGenerator,
      context: .extraBigAmount,
      checkIfContainsIn: ContextualIntDataSet.shared.extraBigAmount
    )
  }

  internal func test_intGeneratedWithSocialMediaReactionsHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator,
      context: .socialMediaReactions
    )

    generate(
      type: Int.self,
      using: &systemRandomNumberGenerator,
      context: .socialMediaReactions,
      checkIfContainsIn: ContextualIntDataSet.shared.socialMediaReactions
    )
  }

  internal func test_intGeneratedWithHugeAmountSocialMediaReactionsHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator,
      context: .hugeAmountSocialMediaReactions
    )

    generate(
      type: Int.self,
      using: &systemRandomNumberGenerator,
      context: .hugeAmountSocialMediaReactions,
      checkIfContainsIn: ContextualIntDataSet.shared.hugeAmountSocialMediaReactions
    )
  }

  internal func test_intGeneratedWithSmallFileBytesHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator,
      context: .smallFileBytes
    )

    generate(
      type: Int.self,
      using: &systemRandomNumberGenerator,
      context: .smallFileBytes,
      checkIfContainsIn: ContextualIntDataSet.shared.smallFileBytes
    )
  }

  internal func test_intGeneratedWithLargeFileBytesHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator,
      context: .largeFileBytes
    )

    generate(
      type: Int.self,
      using: &systemRandomNumberGenerator,
      context: .largeFileBytes,
      checkIfContainsIn: ContextualIntDataSet.shared.largeFileBytes
    )
  }

  internal func test_intGeneratedWithEntityNumberHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: Int.self,
      using: &randomNumberGenerator,
      context: .entityNumber
    )

    generate(
      type: Int.self,
      using: &systemRandomNumberGenerator,
      context: .entityNumber,
      checkIfContainsIn: ContextualIntDataSet.shared.entityNumber
    )
  }
}
// swiftlint:enable implicitly_unwrapped_optional
