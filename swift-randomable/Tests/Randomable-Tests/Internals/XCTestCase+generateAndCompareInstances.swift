import Randomable
import XCTest

extension XCTestCase {
  internal func generateAndCompareInstances<T: Randomable & Equatable>(
    of type: T.Type,
    using randomNumberGenerator: inout any RandomNumberGenerator,
    generation: (_ type: T.Type, _ generator: inout any RandomNumberGenerator) -> T = { $0.random(&$1) },
    assertions: (_ instance1: T, _ instance2: T) -> () = { XCTAssertEqual($0, $1) }
  ) {
    generateInstances(
      of: type,
      using: &randomNumberGenerator,
      generation: generation,
      assertions: assertions
    )
  }

  internal func generateInstances<T: Randomable>(
    of type: T.Type,
    using randomNumberGenerator: inout any RandomNumberGenerator,
    generation: (_ type: T.Type, _ generator: inout any RandomNumberGenerator) -> T = { $0.random(&$1) },
    assertions: (_ instance1: T, _ instance2: T) -> ()
  ) {
    assertions(
      generation(type, &randomNumberGenerator),
      generation(type, &randomNumberGenerator)
    )
  }
}
