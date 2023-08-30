/**
 Signifies ability of statically generating random/mock instances of the conforming types using context as a semantic "hint".
 */
public protocol ContextualRandomable {
  /**
   Object that defines available contextual hints that can be used in the instance generation process.
   */
  associatedtype Context

  /**
   Generates single random instance of given type.

   - Parameter context: Contextual hint that influences the generation result.
   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func random(
    _ context: Context,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self

  /**
   Generates single random instance of given type.
   Uses system's default `RandomNumberGenerator`to seed randomness.

   - Parameter context: Contextual hint that influences the generation result.
   */
  static func random(
    _ context: Context
  ) -> Self

  /**
   Generates array of random instances of given type.

   - Parameter context: Contextual hint that influences the generation result.
   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms(
    _ context: Context,
    _ randomNumberGenerator: inout any RandomNumberGenerator
  ) -> [Self]

  /**
   Generates array of random instances of given type. Uses system's default `RandomNumberGenerator`to seed randomness.

   - Parameter context: Contextual hint that influences the generation result.
   */
  static func randoms(
    _ context: Context
  ) -> [Self]
}
