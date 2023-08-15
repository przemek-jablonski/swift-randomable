@testable import Randomable
import XCTest

// swiftlint:disable all
// TODO: swiftlint
internal final class FoundationContextualRandomableTestCase: XCTestCase {
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

  internal func test_stringGeneratedWithCommitIdHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .commitId
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .commitId,
      checkIfContainsIn: ContextualStringDataSet.shared.commitId
    )
  }

  internal func test_stringGeneratedWithShaHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .sha
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .sha,
      checkIfContainsIn: ContextualStringDataSet.shared.sha
    )
  }

  internal func test_stringGeneratedWithPermissionHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .permission
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .permission,
      checkIfContainsIn: ContextualStringDataSet.shared.permission
    )
  }

  internal func test_stringGeneratedWithFirstNameHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .firstName
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .firstName,
      checkIfContainsIn: ContextualStringDataSet.shared.firstName
    )
  }

  internal func test_stringGeneratedWithLastNameHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .lastName
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .lastName,
      checkIfContainsIn: ContextualStringDataSet.shared.lastName
    )
  }

  internal func test_stringGeneratedWithPersonFullNameHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .personFullName
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .personFullName,
      checkIfContainsIn: ContextualStringDataSet.shared.personFullName
    )
  }

  internal func test_stringGeneratedWithBusinessTitleHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .businessTitle
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .businessTitle,
      checkIfContainsIn: ContextualStringDataSet.shared.businessTitle
    )
  }

  internal func test_stringGeneratedWithCompanyHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .company
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .company,
      checkIfContainsIn: ContextualStringDataSet.shared.company
    )
  }

  internal func test_stringGeneratedWithUserNameHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .userName
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .userName,
      checkIfContainsIn: ContextualStringDataSet.shared.userName
    )
  }

  internal func test_stringGeneratedWithRepositoryNameHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .repositoryName
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .repositoryName,
      checkIfContainsIn: ContextualStringDataSet.shared.repositoryName
    )
  }

  internal func test_stringGeneratedWithGithubFullRepoNameHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .githubFullRepoName
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .githubFullRepoName,
      checkIfContainsIn: ContextualStringDataSet.shared.githubFullRepoName
    )
  }

  internal func test_stringGeneratedWithCurrencyHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .currency
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .currency,
      checkIfContainsIn: ContextualStringDataSet.shared.currency
    )
  }

  internal func test_stringGeneratedWithCryptoCurrencyHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .cryptoCurrency
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .cryptoCurrency,
      checkIfContainsIn: ContextualStringDataSet.shared.cryptoCurrency
    )
  }

  internal func test_stringGeneratedWithLanguageHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .language
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .language,
      checkIfContainsIn: ContextualStringDataSet.shared.language
    )
  }

  internal func test_stringGeneratedWithLangHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .lang
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .lang,
      checkIfContainsIn: ContextualStringDataSet.shared.lang
    )
  }

  internal func test_stringGeneratedWithLocaleHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .locale
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .locale,
      checkIfContainsIn: ContextualStringDataSet.shared.locale
    )
  }

  internal func test_stringGeneratedWithCityHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .city
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .city,
      checkIfContainsIn: ContextualStringDataSet.shared.city
    )
  }

  internal func test_stringGeneratedWithCountryHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .country
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .country,
      checkIfContainsIn: ContextualStringDataSet.shared.country
    )
  }

  internal func test_stringGeneratedWithAddressHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .address
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .address,
      checkIfContainsIn: ContextualStringDataSet.shared.address
    )
  }

  internal func test_stringGeneratedWithBoolHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .bool
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .bool,
      checkIfContainsIn: ContextualStringDataSet.shared.bool
    )
  }

  internal func test_stringGeneratedWithColorHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .color
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .color,
      checkIfContainsIn: ContextualStringDataSet.shared.color
    )
  }

  internal func test_stringGeneratedWithTagHint_shouldUseBothRandomNumberGeneratorAndSemanticDataSet() {
    generateAndCompareInstances(
      of: String.self,
      using: &randomNumberGenerator,
      context: .tag
    )

    generate(
      type: String.self,
      using: &systemRandomNumberGenerator,
      context: .tag,
      checkIfContainsIn: ContextualStringDataSet.shared.tag
    )
  }
}

extension XCTestCase {
  internal func generateAndCompareInstances<T: ContextualRandomable & Equatable>(
    of type: T.Type,
    using randomNumberGenerator: inout any RandomNumberGenerator,
    context: T.Context,
    generation: (_ type: T.Type, _ context: T.Context, _ generator: inout any RandomNumberGenerator) -> T = { $0.random($1, &$2) },
    assertions: (_ instance1: T, _ instance2: T) -> () = { XCTAssertEqual($0, $1) }
  ) {
    assertions(
      generation(type, context, &randomNumberGenerator),
      generation(type, context, &randomNumberGenerator)
    )
  }

  internal func generate<T: ContextualRandomable & Equatable>(
    type: T.Type,
    using randomNumberGenerator: inout any RandomNumberGenerator,
    context: T.Context,
    generation: (_ type: T.Type, _ context: T.Context, _ generator: inout any RandomNumberGenerator) -> T = { $0.random($1, &$2) },
    checkIfContainsIn dataSet: [T]
  ) {
    let generated = generation(
      type,
      context,
      &randomNumberGenerator
    )

    XCTAssertTrue(
      dataSet.contains(generated),
      "Generated instance (\(String(describing: generated))) is not present in the data set (\(String(describing: dataSet))"
    )
  }
}
