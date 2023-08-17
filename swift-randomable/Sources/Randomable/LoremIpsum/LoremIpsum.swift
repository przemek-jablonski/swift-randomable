import Foundation

// swiftlint:disable force_unwrapping
// swiftlint:disable no_magic_numbers
/**
 Namespace for the functions generating "Lorem Ipsum" text chunks.
 */
public enum LoremIpsum {}

// swiftlint:disable:next line_length
private let lorem = "Curabitur quis nisl scelerisque, lobortis sapien eu, consequat dolor. Duis ante tortor, tempus ut malesuada a, ullamcorper nec nulla. Suspendisse ultrices nisi ut molestie congue. Integer vulputate diam tortor, vitae aliquam nisl auctor scelerisque. Sed vulputate justo porttitor odio egestas iaculis. In commodo, ex ac commodo facilisis, mauris libero egestas lacus, quis aliquam magna libero id metus. Cras ac nunc lobortis, luctus libero sed, eleifend dui. Curabitur eleifend placerat facilisis. Mauris convallis ante erat, ut ullamcorper leo tempor et. Proin massa enim, lobortis eu justo in, malesuada accumsan dui. In turpis mauris, lacinia nec urna mattis, tincidunt porttitor nisl. Vivamus non iaculis nibh, non tincidunt massa. Sed id malesuada nisi, eu cursus mi. Praesent pharetra varius semper. Morbi lacus diam, sollicitudin sit amet sapien at, ultrices elementum ligula. Sed et est quis est sodales sodales. Praesent eleifend eu nunc vitae elementum. In hac habitasse platea dictumst. Sed a tincidunt elit, vitae laoreet quam. In ut tincidunt augue. Pellentesque venenatis eu justo at aliquet. Aenean nisi ante, dignissim ac cursus sed, ultricies a tellus. Pellentesque elementum tellus vitae felis commodo iaculis. Aliquam tincidunt est at justo condimentum posuere. Etiam et sollicitudin tortor. Cras dui orci, molestie a commodo sit amet, imperdiet et nibh. Nam eu lacus et tortor vestibulum volutpat. Ut dapibus ultrices mauris ut ullamcorper. Donec semper eget ante sit amet lacinia. Cras felis ipsum, elementum eget bibendum sit amet, vulputate ac massa. Sed ornare metus et tellus sagittis volutpat. Nam sodales volutpat elementum. Aenean pulvinar magna leo, eget rhoncus velit dictum sit amet. Etiam fermentum ipsum turpis, sit amet viverra ante dictum bibendum."

private extension LoremIpsum {
  static let full = lorem
  static let words = LoremIpsum.full.components(separatedBy: " ")
  static let sentences = LoremIpsum.full.components(separatedBy: ". ")
}

public extension LoremIpsum {
  /**
   Generates random chunk of "Lorem Ipsum" text.

   - Note: The length of the Lorem Ipsum chunk may vary drastically. If there is a need for some more control over chunk length,
   refer to the other static `LoremIpsum` variables, such as `LoremIpsum.singleWord` or `LoremIpsum.extraExtraLong`.

   Examples:
   - `"Curabitur quis nisl."`
   - `"Sed"`
   - `"Praesent eleifend eu nunc vitae elementum. In hac habitasse platea dictumst. Sed a tincidun"`
   */
  static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> String {
    switch Int.random(in: 1...4, using: &randomNumberGenerator) {
      case 1: return LoremIpsum.singleWord(&randomNumberGenerator)
      case 2: return LoremIpsum.short(&randomNumberGenerator)
      case 3: return LoremIpsum.regular(&randomNumberGenerator)
      default: return LoremIpsum.extraLong(&randomNumberGenerator)
    }
  }
}

public extension LoremIpsum {
  /**
   Returns single word from the Lorem Ipsum text.
   
   Examples:
   - `"Curabitur"`
   - `"Sed"`
   - `"Pellentesque"`
   */
  static func singleWord(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> String {
    LoremIpsum
      .words
      .filter { $0.count > 4 }
      .randomElement(using: &randomNumberGenerator)!
      .filter { CharacterSet.letters.contains($0.unicodeScalars.first!) }
      .capitalized
  }

  /**
   Returns a short chunk of Lorem Ipsum text.
   
   Examples:
   - `"Cras dui orci"`
   - `"Curabitur"`
   - `"Placerat facilisis"`
   */
  static func short(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> String {
    (1...3)
      .map { _ in
        LoremIpsum
          .words
          .randomElement(using: &randomNumberGenerator)!
          .filter { CharacterSet.letters.contains($0.unicodeScalars.first!) }
      }
      .joined(separator: ", ")
      .capitalized
  }

  /**
   Returns a regular chunk of Lorem Ipsum text (4 to 9 words), capitalized and suffixed with the dot.
   
   Examples:
   - `"Nam sodales volutpat elementum. Aenean pulvinar magna leo."`
   - `"Sed Ornare Metus Et."`
   */
  static func regular(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> String {
    (4...9)
      .map { _ in
        LoremIpsum
          .words
          .randomElement(using: &randomNumberGenerator)!
          .filter { CharacterSet.letters.contains($0.unicodeScalars.first!) }
      }
      .joined(separator: ", ")
      .capitalized
    + "."
  }

  /**
   Returns a long chunk of Lorem Ipsum text (single actual sentence), capitalized and suffixed with the dot.
   
   Examples:
   - `"Etiam fermentum ipsum turpis, sit amet viverra ante dictum bibendum."`
   - `"Suspendisse ultrices nisi ut molestie congue."`
   - `"Praesent eleifend eu nunc vitae elementum."`
   */
  static func long(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> String {
    let random = LoremIpsum.sentences.randomElement(using: &randomNumberGenerator)!
    if !CharacterSet.letters.contains(random.last!.unicodeScalars.first!) {
      return random.dropLast() + "."
    }
    return random + "."
  }

  /**
   Returns an extra long chunk of Lorem Ipsum text (2 to 3 sentences joined together).

   Example:
   - `"Praesent eleifend eu nunc vitae elementum. Sed et est quis est sodales sodales."`
   */
  static func extraLong(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> String {
    (2...3)
      .map { _ in
        LoremIpsum.long(&randomNumberGenerator)
      }
      .joined(separator: " ")
  }

  /**
   Returns an extra long chunk of Lorem Ipsum text (3 to 5 sentences joined together).
   */
  static func extraExtraLong(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> String {
    (3...5)
      .map { _ in
        LoremIpsum.long(&randomNumberGenerator)
      }
      .joined(separator: " ")
  }
}
// swiftlint:enable force_unwrapping
// swiftlint:enable no_magic_numbers
