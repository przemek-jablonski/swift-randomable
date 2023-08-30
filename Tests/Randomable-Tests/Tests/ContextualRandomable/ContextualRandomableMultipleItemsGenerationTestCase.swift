@testable import Randomable
import XCTest

internal class ContextualRandomableMultipleItemsGenerationTestCase: XCTestCase {

  override internal func tearDown() async throws {
    Constants.override(randomItemsCount: nil)
  }

  internal func test_generatingMultipleNonHashableItems_withStaticGenerator1_mightGenerateDuplicateItems() throws {
    var randomNumberGenerator: any RandomNumberGenerator = try StaticRandomNumberGenerator(value: 1)
    // `Model` is not Hashable (has `nonHashableElement` property).
    // Every `Model` instance is equal since it's contents are always equal.
    struct Model: ContextualRandomable, Equatable {
      let nonHashableElement = NonHashableObject()

      class NonHashableObject: Equatable {
        static func == (lhs: Model.NonHashableObject, rhs: Model.NonHashableObject) -> Bool { true }
      }

      enum Context { case context }
      static func random(
        _ context: Context,
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Self {
        Self()
      }
    }

    let randomElementsCount = 10
    Constants.override(randomItemsCount: { _ in randomElementsCount })

    performMultipleRandomItemsGeneration(
      type: Model.self,
      using: &randomNumberGenerator,
      context: .context,
      assertions: { randoms in
        // Since all `Model` instances are equal to each other (because of static contents)
        // and the `ContextualRandomable.randoms()` implementation does not enforce
        // uniqueness for models with just `Equatable` conformance.
        XCTAssertLessThanOrEqual(randoms.count, randomElementsCount)
      }
    )
  }

  internal func test_generatingMultipleNonHashableItems_withStaticGenerator2_mightGenerateDuplicateItems() throws {
    var randomNumberGenerator: any RandomNumberGenerator = try StaticRandomNumberGenerator(value: 100000)
    // `Model` is not Hashable (has `nonHashableElement` property).
    // Every `Model` instance is equal since it's contents are always equal.
    struct Model: ContextualRandomable, Equatable {
      let nonHashableElement = NonHashableObject()

      class NonHashableObject: Equatable {
        static func == (lhs: Model.NonHashableObject, rhs: Model.NonHashableObject) -> Bool { true }
      }

      enum Context { case context }
      static func random(
        _ context: Context,
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Self {
        Self()
      }
    }

    let randomElementsCount = 10
    Constants.override(randomItemsCount: { _ in randomElementsCount })

    performMultipleRandomItemsGeneration(
      type: Model.self,
      using: &randomNumberGenerator,
      context: .context,
      assertions: { randoms in
        // Since all `Model` instances are equal to each other (because of static contents)
        // and the `ContextualRandomable.randoms()` implementation does not enforce
        // uniqueness for models with just `Equatable` conformance
        XCTAssertLessThanOrEqual(randoms.count, randomElementsCount)
      }
    )
  }

  internal func test_generatingMultipleHashableItems_withStaticGenerator1_removesDuplicatesFromResultArray() throws {
    var randomNumberGenerator: any RandomNumberGenerator = try StaticRandomNumberGenerator(value: 1)
    // `Model` is Hashable, but it's contents are static, always equal.
    struct Model: ContextualRandomable, Hashable {
      let staticContents = 1

      enum Context { case context }
      static func random(
        _ context: Context,
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Self {
        Self()
      }
    }

    let randomElementsCount = 10
    Constants.override(randomItemsCount: { _ in randomElementsCount })

    performMultipleRandomItemsGeneration(
      type: Model.self,
      using: &randomNumberGenerator,
      context: .context,
      assertions: { randoms in
        // Since all `Model` instances are equal to each other (because of static contents)
        // BUT the `ContextualRandomable.randoms()` implementation DOES enforce
        // uniqueness for models with `Hashable` conformance
        // it means that the resulting array will have exactly 1 element.
        XCTAssertEqual(randoms.count, 1)
      }
    )
  }

  internal func test_generatingMultipleHashableItems_withStaticGenerator2_removesDuplicatesFromResultArray() throws {
    var randomNumberGenerator: any RandomNumberGenerator = try StaticRandomNumberGenerator(value: 100000)
    // `Model` is Hashable, but it's contents are static, always equal.
    struct Model: ContextualRandomable, Hashable {
      let staticContents = 1

      enum Context { case context }
      static func random(
        _ context: Context,
        _ randomNumberGenerator: inout RandomNumberGenerator
      ) -> Self {
        Self()
      }
    }

    let randomElementsCount = 10
    Constants.override(randomItemsCount: { _ in randomElementsCount })

    performMultipleRandomItemsGeneration(
      type: Model.self,
      using: &randomNumberGenerator,
      context: .context,
      assertions: { randoms in
        // Since all `Model` instances are equal to each other (because of static contents)
        // BUT the `ContextualRandomable.randoms()` implementation DOES enforce
        // uniqueness for models with `Hashable` conformance
        // it means that the resulting array will have exactly 1 element.
        XCTAssertEqual(randoms.count, 1)
      }
    )
  }

  internal func test_generatingMultipleIdentifiableItems_withStaticGenerator1_removesDuplicatesFromResultArray() throws {
    var randomNumberGenerator: any RandomNumberGenerator = try StaticRandomNumberGenerator(value: 1)
    // `Model` is `Identifiable` but the `id` field is always equal.
    struct Model: ContextualRandomable, Hashable, Identifiable {
      let id = 1
      let string: String
      let double: Double

      enum Context { case context }
      static func random(
        _ context: Context,
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
      type: Model.self,
      using: &randomNumberGenerator,
      context: .context,
      assertions: { randoms in
        // Even though all `Model` instances are unique and not equal to each other
        // the resulting array should have exactly 1 element because not only
        // `ContextualRandomable.randoms()` implementation DOES enforce uniqueness
        // for models with `Hashable` conformance but ALSO enforces uniqueness of id's.
        // Since all `Models` have `id = 1`, then the resulting array has only 1 element.
        XCTAssertEqual(randoms.count, 1)
      }
    )
  }

  internal func test_generatingMultipleIdentifiableItems_withStaticGenerator2_removesDuplicatesFromResultArray() throws {
    var randomNumberGenerator: any RandomNumberGenerator = try StaticRandomNumberGenerator(value: 100000)
    // `Model` is `Identifiable` but the `id` field is always equal.
    struct Model: ContextualRandomable, Hashable, Identifiable {
      let id = 1
      let string: String
      let double: Double

      enum Context { case context }
      static func random(
        _ context: Context,
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
      type: Model.self,
      using: &randomNumberGenerator,
      context: .context,
      assertions: { randoms in
        // Even though all `Model` instances are unique and not equal to each other
        // the resulting array should have exactly 1 element because not only
        // `ContextualRandomable.randoms()` implementation DOES enforce uniqueness
        // for models with `Hashable` conformance but ALSO enforces uniqueness of id's.
        // Since all `Models` have `id = 1`, then the resulting array has only 1 element.
        XCTAssertEqual(randoms.count, 1)
      }
    )
  }
}

extension XCTestCase {
  internal func performMultipleRandomItemsGeneration<T: ContextualRandomable>(
    type: T.Type,
    using randomNumberGenerator: inout any RandomNumberGenerator,
    context: T.Context,
    assertions: ([T]) -> ()
  ) {
    assertions(
      T.randoms(
        context,
        &randomNumberGenerator
      )
    )
  }
}
