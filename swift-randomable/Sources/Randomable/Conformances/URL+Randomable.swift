import Foundation

extension URL: Randomable {
  // swiftlint:disable force_unwrapping
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> URL {
    URL(string: [
      "https://google.com",
      "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
      "https://picsum.photos/id/870/200/300?grayscale&blur=2",
      "https://i.redd.it/vwlgciqshjp41.jpg",
      "https://en.wikipedia.org/wiki/Lorem_ipsum"
    ].random()
    )!
  }
  // swiftlint:enable force_unwrapping
}
