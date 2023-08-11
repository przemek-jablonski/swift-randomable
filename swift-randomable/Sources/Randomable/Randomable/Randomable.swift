/**
 Signifies ability of generating random/mock instances of the conforming types.
 */
public protocol Randomable {
  /**
   Generates single random instance of given type.

   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self

  /**
   Generates single random instance of given type.
   Uses system's default `RandomNumberGenerator`to seed randomness.
   */
  static func random() -> Self

  /**
   Generates array of random instances of given type.

   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms(
    _ randomNumberGenerator: inout any RandomNumberGenerator
  ) -> [Self]

  /**
   Generates array of random instances of given type. Uses system's default `RandomNumberGenerator`to seed randomness.
   */
  static func randoms() -> [Self]
}
