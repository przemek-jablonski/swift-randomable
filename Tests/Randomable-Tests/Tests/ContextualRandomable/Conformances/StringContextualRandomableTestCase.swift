@testable import Randomable
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
// swiftlint:disable type_body_length
internal final class StringContextualRandomableTestCase: XCTestCase {
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
// swiftlint:enable implicitly_unwrapped_optional
// swiftlint:enable type_body_length
