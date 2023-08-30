@testable import Randomable
import XCTest

internal class RandomableMultipleItemsGenerationTestCase: XCTestCase {

  override internal func tearDown() async throws {
    Constants.override(randomItemsCount: nil)
  }

  internal func test_generatingMultipleNonHashableItems_withStaticGenerator1_mightGenerateDuplicateItems() throws {
    var randomNumberGenerator: any RandomNumberGenerator = try StaticRandomNumberGenerator(value: 1)
    // `Model` is not Hashable (has `nonHashableElement` property).
    // Every `Model` instance is equal since it's contents are always equal.
    struct Model: Randomable, Equatable {
      let nonHashableElement = NonHashableObject()

      class NonHashableObject: Equatable {
        static func == (lhs: Model.NonHashableObject, rhs: Model.NonHashableObject) -> Bool { true }
      }

      static func random(
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Self {
        Self()
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
        // uniqueness for models with just `Equatable` conformance.
        XCTAssertLessThanOrEqual(randoms.count, randomElementsCount)
      }
    )
  }

  internal func test_generatingMultipleNonHashableItems_withStaticGenerator2_mightGenerateDuplicateItems() throws {
    var randomNumberGenerator: any RandomNumberGenerator = try StaticRandomNumberGenerator(value: 100000)
    // `Model` is not Hashable (has `nonHashableElement` property).
    // Every `Model` instance is equal since it's contents are always equal.
    struct Model: Randomable, Equatable {
      let nonHashableElement = NonHashableObject()

      class NonHashableObject: Equatable {
        static func == (lhs: Model.NonHashableObject, rhs: Model.NonHashableObject) -> Bool { true }
      }

      static func random(
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Self {
        Self()
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
        XCTAssertLessThanOrEqual(randoms.count, randomElementsCount)
      }
    )
  }

  internal func test_generatingMultipleHashableItems_withStaticGenerator1_removesDuplicatesFromResultArray() throws {
    var randomNumberGenerator: any RandomNumberGenerator = try StaticRandomNumberGenerator(value: 1)
    // `Model` is Hashable, but it's contents are static, always equal.
    struct Model: Randomable, Hashable {
      let staticContents = 1

      static func random(
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Self {
        Self()
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

  internal func test_generatingMultipleHashableItems_withStaticGenerator2_removesDuplicatesFromResultArray() throws {
    var randomNumberGenerator: any RandomNumberGenerator = try StaticRandomNumberGenerator(value: 100000)
    // `Model` is Hashable, but it's contents are static, always equal.
    struct Model: Randomable, Hashable {
      let staticContents = 1

      static func random(
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Self {
        Self()
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

  internal func test_generatingMultipleIdentifiableItems_withStaticGenerator1_removesDuplicatesFromResultArray() throws {
    var randomNumberGenerator: any RandomNumberGenerator = try StaticRandomNumberGenerator(value: 1)
    // `Model` is `Identifiable` but the `id` field is always equal.
    struct Model: Randomable, Hashable, Identifiable {
      let id = 1
      let string: String
      let double: Double

      static func random(
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Self {
        var systemRandomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
        return Self(
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

  internal func test_generatingMultipleIdentifiableItems_withStaticGenerator2_removesDuplicatesFromResultArray() throws {
    var randomNumberGenerator: any RandomNumberGenerator = try StaticRandomNumberGenerator(value: 100000)
    // `Model` is `Identifiable` but the `id` field is always equal.
    struct Model: Randomable, Hashable, Identifiable {
      let id = 1
      let string: String
      let double: Double

      static func random(
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Self {
        var systemRandomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
        return Self(
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
  internal func performMultipleRandomItemsGeneration<T: Randomable>(
    from type: T.Type,
    using randomNumberGenerator: inout any RandomNumberGenerator,
    assertions: ([T]) -> ()
  ) {
    assertions(T.randoms(&randomNumberGenerator))
  }
}
