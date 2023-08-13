@testable import Randomable
import XCTest

internal class RandomableMultipleItemsGenerationTestCase: XCTestCase {
  var randomNumberGenerator: (any RandomNumberGenerator)!

  override func setUp() {
    self.randomNumberGenerator = StaticRandomNumberGenerator()
  }

  override func tearDown() async throws {
    self.randomNumberGenerator = nil
    Constants.override(randomItemsCount: nil)
  }

  func test_generatingMultipleRandomItems_withNonHashableModel_mightGenerateDuplicateItems() {

    // `Model` is not Hashable (has `nonHashableElement` property)
    // Every `Model` instance is equal since it's contents are always the same.
    struct Model: Randomable, Equatable {
      let nonHashableElement = NonHashableObject()

      class NonHashableObject: Equatable {
        static func == (lhs: Model.NonHashableObject, rhs: Model.NonHashableObject) -> Bool { true }
      }

      static func random(
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Self {
        Self.init()
      }
    }

    let randomElementsCount = 10
    Constants.override(randomItemsCount: { _ in randomElementsCount })

    performMultipleRandomItemsGeneration(
      from: Model.self,
      using: &randomNumberGenerator,
      assertions: { randoms in
        // Since all `Model` instances are equal to each other (because of static contents)
        // and the `Randomable.randoms()` implementation does not enforce
        // uniqueness for models with just `Equatable` conformance
        // it means that the resulting array will have exactly `randomElementsCount`.
        XCTAssertEqual(randoms.count, randomElementsCount)
      }
    )
  }

  func test_generatingMultipleRandomItems_withHashableModel_removesDuplicatesFromResultArray() {

    // `Model` is Hashable, but it's contents are static, always the same
    struct Model: Randomable, Hashable {
      let staticContents = 1

      static func random(
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Model {
        Self.init()
      }
    }

    let randomElementsCount = 10
    Constants.override(randomItemsCount: { _ in randomElementsCount })

    performMultipleRandomItemsGeneration(
      from: Model.self,
      using: &randomNumberGenerator,
      assertions: { randoms in
        // Since all `Model` instances are equal to each other (because of static contents)
        // BUT the `Randomable.randoms()` implementation DOES enforce
        // uniqueness for models with `Hashable` conformance
        // it means that the resulting array will have exactly 1 element.
        XCTAssertEqual(randoms.count, 1)
      }
    )
  }

  func test_generatingMultipleRandomItems_withHashableIdentifiableModel_removesDuplicatesFromResultArray() {
    // `Model` is `Identifiable` but the `id` field is always the same.
    struct Model: Randomable, Hashable, Identifiable {
      let id = 1
      let string: String
      let double: Double

      static func random(
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Model {
        var systemRandomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
        return Self.init(
          string: .random(&systemRandomNumberGenerator),
          double: .random(&systemRandomNumberGenerator)
        )
      }
    }

    let randomElementsCount = 10
    Constants.override(randomItemsCount: { _ in randomElementsCount })

    performMultipleRandomItemsGeneration(
      from: Model.self,
      using: &randomNumberGenerator,
      assertions: { randoms in
        // Even though all `Model` instances are unique and not equal to each other
        // the resulting array should have exactly 1 element because not only
        // `Randomable.randoms()` implementation DOES enforce uniqueness
        // for models with `Hashable` conformance but ALSO enforces uniqueness of id's.
        // Since all `Models` have `id = 1`, then the resulting array has only 1 element.
        XCTAssertEqual(randoms.count, 1)
      }
    )
  }
}

extension XCTestCase {
  func performMultipleRandomItemsGeneration<T: Randomable>(
    from type: T.Type,
    using randomNumberGenerator: inout any RandomNumberGenerator,
    assertions: ([T]) -> ()
  ) {
    assertions(T.randoms(&randomNumberGenerator))
  }
}
