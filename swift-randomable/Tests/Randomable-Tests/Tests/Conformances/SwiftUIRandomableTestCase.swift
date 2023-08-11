import SwiftUI
import Randomable
import XCTest

internal class SwiftUIRandomableTestCase: XCTestCase {
  var randomNumberGenerator: (any RandomNumberGenerator)!

  override func setUp() {
    self.randomNumberGenerator = StaticRandomNumberGenerator()
  }

  override func tearDown() async throws {
    self.randomNumberGenerator = nil
  }

  internal func test_twoColorInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateAndCompareInstances(
      of: Color.self,
      using: &randomNumberGenerator
    )
  }
}
