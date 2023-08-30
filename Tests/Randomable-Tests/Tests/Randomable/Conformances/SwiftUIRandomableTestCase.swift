import Randomable
import SwiftUI
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
internal class SwiftUIRandomableTestCase: XCTestCase {
  internal var randomNumberGenerator: (any RandomNumberGenerator)!

  override internal func setUp() async throws {
    self.randomNumberGenerator = try StaticRandomNumberGenerator()
  }

  override internal func tearDown() async throws {
    self.randomNumberGenerator = nil
  }

  internal func test_twoColorInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Color.self,
      using: &randomNumberGenerator
    )
  }
}
// swiftlint:enable implicitly_unwrapped_optional
