import MapKit
import Randomable
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
internal class MapKitRandomableTestCase: XCTestCase {
  internal var randomNumberGenerator: (any RandomNumberGenerator)!

  override internal func setUp() async throws {
    self.randomNumberGenerator = try StaticRandomNumberGenerator()
  }

  override internal func tearDown() async throws {
    self.randomNumberGenerator = nil
  }

  internal func test_twoMKCoordinateRegionInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateInstances(
      of: MKCoordinateRegion.self,
      using: &randomNumberGenerator,
      assertions: { instance1, instance2 in
        XCTAssertEqual(
          instance1.center.latitude,
          instance2.center.latitude
        )

        XCTAssertEqual(
          instance1.center.longitude,
          instance2.center.longitude
        )

        XCTAssertEqual(
          instance1.span.longitudeDelta,
          instance2.span.longitudeDelta
        )

        XCTAssertEqual(
          instance1.span.latitudeDelta,
          instance2.span.latitudeDelta
        )
      }
    )
  }

  internal func test_twoCLLocationCoordinate2DInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateInstances(
      of: CLLocationCoordinate2D.self,
      using: &randomNumberGenerator,
      assertions: { instance1, instance2 in
        XCTAssertEqual(
          instance1.latitude,
          instance2.latitude
        )

        XCTAssertEqual(
          instance1.longitude,
          instance2.longitude
        )
      }
    )
  }

  internal func test_twoMKCoordinateSpanInstances_generatedUsingStaticGenerator_shouldBeEqual() {
    generateInstances(
      of: MKCoordinateSpan.self,
      using: &randomNumberGenerator,
      assertions: { instance1, instance2 in
        XCTAssertEqual(
          instance1.longitudeDelta,
          instance2.longitudeDelta
        )

        XCTAssertEqual(
          instance1.latitudeDelta,
          instance2.latitudeDelta
        )
      }
    )
  }
}
// swiftlint:enable implicitly_unwrapped_optional
