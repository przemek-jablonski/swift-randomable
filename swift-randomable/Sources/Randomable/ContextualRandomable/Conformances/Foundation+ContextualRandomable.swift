import Foundation

// swiftlint:disable all
// TODO: Swiftlint

extension Int: ContextualRandomable {
  public enum Context {
    case percent0_100

    case positive
    case negative

    case smallAmount
    case regularAmount
    case bigAmount
    case extraBigAmount

    case socialMediaReactions
    case hugeAmountSocialMediaReactions

    case smallFileBytes
    case largeFileBytes

    case entityNumber
  }

  public static func random(
    _ context: Context,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Self.random(
      context,
      .shared,
      &randomNumberGenerator
    )
  }

  internal static func random(
    _ context: Context,
    _ dataSet: ContextualIntDataSet,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    switch context {
      case .bigAmount: return dataSet.bigAmount.randomElement(using: &randomNumberGenerator)!
      case .entityNumber: return dataSet.entityNumber.randomElement(using: &randomNumberGenerator)!
      case .extraBigAmount: return dataSet.extraBigAmount.randomElement(using: &randomNumberGenerator)!
      case .hugeAmountSocialMediaReactions: return dataSet.hugeAmountSocialMediaReactions.randomElement(using: &randomNumberGenerator)!
      case .largeFileBytes: return dataSet.largeFileBytes.randomElement(using: &randomNumberGenerator)!
      case .negative: return dataSet.negative.randomElement(using: &randomNumberGenerator)!
      case .percent0_100: return dataSet.percent0_100.randomElement(using: &randomNumberGenerator)!
      case .positive: return dataSet.positive.randomElement(using: &randomNumberGenerator)!
      case .regularAmount: return dataSet.regularAmount.randomElement(using: &randomNumberGenerator)!
      case .smallAmount: return dataSet.smallAmount.randomElement(using: &randomNumberGenerator)!
      case .smallFileBytes: return dataSet.smallFileBytes.randomElement(using: &randomNumberGenerator)!
      case .socialMediaReactions: return dataSet.socialMediaReactions.randomElement(using: &randomNumberGenerator)!
    }
  }
}

extension Float: ContextualRandomable {
  public enum Context {
    case percent0_1
    case percent0_100

    case positive
    case negative

    case smallAmount
    case regularAmount
    case bigAmount
    case extraBigAmount
  }

  public static func random(
    _ context: Context,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Float(
      Self.random(
        context,
        .shared,
        &randomNumberGenerator
      )
    )
  }

  internal static func random(
    _ context: Context,
    _ dataSet: ContextualFloatDataSet,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Double {
    switch context {
      case .bigAmount: return dataSet.bigAmount.randomElement(using: &randomNumberGenerator)!
      case .extraBigAmount: return dataSet.extraBigAmount.randomElement(using: &randomNumberGenerator)!
      case .negative: return dataSet.negative.randomElement(using: &randomNumberGenerator)!
      case .percent0_1: return dataSet.percent0_1.randomElement(using: &randomNumberGenerator)!
      case .percent0_100: return dataSet.percent0_100.randomElement(using: &randomNumberGenerator)!
      case .positive: return dataSet.positive.randomElement(using: &randomNumberGenerator)!
      case .regularAmount: return dataSet.regularAmount.randomElement(using: &randomNumberGenerator)!
      case .smallAmount: return dataSet.smallAmount.randomElement(using: &randomNumberGenerator)!
    }
  }
}

extension Double: ContextualRandomable {
  public enum Context {
    case percent0_1
    case percent0_100

    case positive
    case negative

    case smallAmount
    case regularAmount
    case bigAmount
    case extraBigAmount
  }

  public static func random(
    _ context: Context,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Self.random(
      context,
      .shared,
      &randomNumberGenerator
    )
  }

  internal static func random(
    _ context: Context,
    _ dataSet: ContextualFloatDataSet,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    switch context {
      case .bigAmount: return dataSet.bigAmount.randomElement(using: &randomNumberGenerator)!
      case .extraBigAmount: return dataSet.extraBigAmount.randomElement(using: &randomNumberGenerator)!
      case .negative: return dataSet.negative.randomElement(using: &randomNumberGenerator)!
      case .percent0_1: return dataSet.percent0_1.randomElement(using: &randomNumberGenerator)!
      case .percent0_100: return dataSet.percent0_100.randomElement(using: &randomNumberGenerator)!
      case .positive: return dataSet.positive.randomElement(using: &randomNumberGenerator)!
      case .regularAmount: return dataSet.regularAmount.randomElement(using: &randomNumberGenerator)!
      case .smallAmount: return dataSet.smallAmount.randomElement(using: &randomNumberGenerator)!
    }
  }
}



extension String: ContextualRandomable {
  public enum Context {
    case commitId
    case sha
    case permission

    case firstName
    case lastName
    case personFullName
    case businessTitle
    case company

    case userName
    case repositoryName
    case githubFullRepoName

    case currency
    case cryptoCurrency

    case language
    case lang
    case locale

    case city
    case country
    case address

    case `bool`
    case `color`

    case tag
  }

  public static func random(
    _ context: Context,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Self.random(
      context,
      .shared,
      &randomNumberGenerator
    )
  }

  internal static func random(
    _ context: Context,
    _ dataSet: ContextualStringDataSet,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    switch context {
      case .commitId:
        return dataSet.commitId.randomElement(using: &randomNumberGenerator)!
      case .sha:
        return dataSet.sha.randomElement(using: &randomNumberGenerator)!
      case .permission:
        return dataSet.permission.randomElement(using: &randomNumberGenerator)!
      case .firstName:
        return dataSet.firstName.randomElement(using: &randomNumberGenerator)!
      case .lastName:
        return dataSet.lastName.randomElement(using: &randomNumberGenerator)!
      case .personFullName:
        return dataSet.personFullName.randomElement(using: &randomNumberGenerator)!
      case .businessTitle:
        return dataSet.businessTitle.randomElement(using: &randomNumberGenerator)!
      case .company:
        return dataSet.company.randomElement(using: &randomNumberGenerator)!
      case .userName:
        return dataSet.userName.randomElement(using: &randomNumberGenerator)!
      case .repositoryName:
        return dataSet.repositoryName.randomElement(using: &randomNumberGenerator)!
      case .githubFullRepoName:
        return dataSet.githubFullRepoName.randomElement(using: &randomNumberGenerator)!
      case .currency:
        return dataSet.currency.randomElement(using: &randomNumberGenerator)!
      case .cryptoCurrency:
        return dataSet.cryptoCurrency.randomElement(using: &randomNumberGenerator)!
      case .language:
        return dataSet.language.randomElement(using: &randomNumberGenerator)!
      case .lang:
        return dataSet.lang.randomElement(using: &randomNumberGenerator)!
      case .locale:
        return dataSet.locale.randomElement(using: &randomNumberGenerator)!
      case .city:
        return dataSet.city.randomElement(using: &randomNumberGenerator)!
      case .country:
        return dataSet.country.randomElement(using: &randomNumberGenerator)!
      case .address:
        return dataSet.address.randomElement(using: &randomNumberGenerator)!
      case .bool:
        return dataSet.bool.randomElement(using: &randomNumberGenerator)!
      case .color:
        return dataSet.color.randomElement(using: &randomNumberGenerator)!
      case .tag:
        return dataSet.tag.randomElement(using: &randomNumberGenerator)!
    }
  }
}
