import Randomable
import XCTest

// MARK: - ContextualRandomable
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
