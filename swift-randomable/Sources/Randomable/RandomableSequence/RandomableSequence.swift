/**
 Signifies ability of statically generating random/mock Sequences of the conforming types.
 */
public protocol RandomableSequence: Sequence where Element: Randomable {
  /**
   Generates single random sequence from given children type.

   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> any Sequence

  /**
   Generates single random instance of given type.
   Uses system's default `RandomNumberGenerator`to seed randomness.
   */
  static func random() -> any Sequence
}
