@testable import Randomable
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
internal class CollectionsRandomableTestCase: XCTestCase {
  internal var randomNumberGenerator: (any RandomNumberGenerator)!

  override internal func setUp() async throws {
    self.randomNumberGenerator = try StaticRandomNumberGenerator(value: .random(in: 1..<999999999))
  }

  override internal func tearDown() async throws {
    self.randomNumberGenerator = nil
  }

  internal struct EquatableModel: Randomable, Equatable {
    private let staticContents = NonHashableObject()

    internal class NonHashableObject: Equatable {
      internal static func == (lhs: NonHashableObject, rhs: NonHashableObject) -> Bool { true }
    }

    internal static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self()
    }
  }

  internal struct HashableModel: Randomable, Hashable {
    private let staticContents = 1

    internal static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self()
    }
  }

  internal struct IdentifiableModel: Randomable, Hashable, Identifiable {
    internal let id = 1
    private let string: String
    private let double: Double

    internal static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      return Self(
        string: .random(&randomNumberGenerator),
        double: .random(&randomNumberGenerator)
      )
    }
  }

  internal func test_twoArraysOfEquatableModels_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Array<EquatableModel>.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoArraysOfHashableModels_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Array<HashableModel>.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoArraysOfIdentifiableModels_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Array<IdentifiableModel>.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_generatingEquatableArrayAndGeneratingMultipleEquatableArrayItems_shouldProduceEqualArrays() {
    XCTAssertEqual(
      [EquatableModel].random(&randomNumberGenerator),
      EquatableModel.randoms(&randomNumberGenerator)
    )
  }

  internal func test_generatingHashableArrayAndGeneratingMultipleHashableArrayItems_shouldProduceEqualArrays() {
    XCTAssertEqual(
      [HashableModel].random(&randomNumberGenerator),
      HashableModel.randoms(&randomNumberGenerator)
    )
  }

  internal func test_generatingIdentifiableArrayAndGeneratingMultipleIdentifiableArrayItems_shouldProduceEqualArrays() {
    XCTAssertEqual(
      [IdentifiableModel].random(&randomNumberGenerator),
      IdentifiableModel.randoms(&randomNumberGenerator)
    )
  }

  internal func test_twoDictionariesOfEquatableModels_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: [Int: EquatableModel].self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoDictionariesOfHashableModels_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: [Int: HashableModel].self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoDictionariesOfIdentifiableModels_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: [Int: IdentifiableModel].self,
      using: &randomNumberGenerator
    )
  }

  internal func test_generatingEquatableDictionaryAndGeneratingMultipleEquatableDictionaryItems_shouldProduceEqualDictionaries() {
    XCTAssertEqual(
      [Int: EquatableModel].random(&randomNumberGenerator).keys.map { $0 },
      Int.randoms(&randomNumberGenerator)
    )
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

  internal func test_twoSetsOfHashableModels_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Set<HashableModel>.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_twoSetsOfIdentifiableModels_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Set<IdentifiableModel>.self,
      using: &randomNumberGenerator
    )
  }

  internal func test_generatingHashableSetAndGeneratingMultipleHashableSetItems_shouldProduceEqualSequences() {
    XCTAssertEqual(
      Array(Set<HashableModel>.random(&randomNumberGenerator)),
      HashableModel.randoms(&randomNumberGenerator)
    )
  }

  internal func test_generatingIdentifiableSetAndGeneratingMultipleIdentifiableSetItems_shouldProduceEqualSequences() {
    XCTAssertEqual(
      Array(Set<IdentifiableModel>.random(&randomNumberGenerator)),
      IdentifiableModel.randoms(&randomNumberGenerator)
    )
  }

  internal func test_twoSubstrings_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Substring.self,
      using: &randomNumberGenerator
    )
  }
}
// swiftlint:enable implicitly_unwrapped_optional
