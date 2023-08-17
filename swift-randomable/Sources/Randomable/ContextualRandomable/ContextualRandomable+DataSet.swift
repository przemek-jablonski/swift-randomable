internal struct ContextualStringDataSet {
  internal static let shared = Self()
  private init() {}

  internal let sha = [
    "60e488d5a98a1be524cfd8397d3cd62d0440536a",
    "6dcb1677748b876b7a5fdfd4ada1fbca08c0b35b",
    "de89e3930c2c010b9151f4d9dad56be830ca5c3b",
    "7f0565bdce4c9d30878bd6d349bd6cc9c88e4c99",
    "4fab0d8ef5ddf4079e28a0828fa69e0d5fbfb8ac"
  ]

  internal let commitId = [
    "fa8e88f",
    "60e488d",
    "6dcb167",
    "de89e39",
    "38bbb0f"
  ]

  internal let permission = [
    "user",
    "moderator",
    "triage",
    "maintainer",
    "admin"
  ]

  internal let firstName = [
    "James",
    "Benjamin",
    "John",
    "Daniel",
    "Olivia",
    "Emma",
    "Charlotte",
    "Amelia"
  ]

  internal let lastName = [
    "Smith",
    "Johnson",
    "Williams",
    "Brown",
    "Jones",
    "Garcia",
    "Miller",
    "Davis",
    "Rodriguez",
    "Martinez"
  ]

  internal let personFullName = [
    "James Smith",
    "Benjamin Johnson",
    "John Williams",
    "Daniel Brown",
    "Olivia Jones",
    "Emma Garcia",
    "Charlotte Miller",
    "Amelia Davis",
    "James Williams",
    "Benjamin Brown",
    "John Jones",
    "Daniel Garcia",
    "Olivia Miller",
    "Emma Davis",
    "Charlotte Rodriguez",
    "Amelia Martinez"
  ]

  internal let businessTitle = [
    "Intern",
    "Contractor",
    "Principal",
    "CEO",
    "CFO",
    "President"
  ]

  internal let company = [
    "Apple",
    "Google",
    "AT&T",
    "Perpetual Income & Growth Investment Trust PLC",
    "Samsung"
  ]

  internal let userName = [
    "torvalds",
    "pointfreeco",
    "githubbot",
    "avdlee",
    "twostraws"
  ]

  internal let repositoryName = [
    "swift-randomable",
    "swift-composable-architecture",
    "llvm-project",
    "standups",
    "isowords"
  ]

  internal let githubFullRepoName = [
    "przemek-jablonski/swift-randomable",
    "pointfreeco/swift-composable-architecture",
    "pointfreeco/swift-snapshot-testing",
    "AvdLee/appstoreconnect-swift-sdk",
    "torvalds/linux",
    "airbnb/swift"
  ]

  internal let currency = [
    "EUR",
    "USD",
    "GBP",
    "CHF",
    "JPY"
  ]

  internal let cryptoCurrency = [
    "BTC",
    "ETH",
    "SOL",
    "XRP",
    "DOGE"
  ]

  internal let language = [
    "English",
    "Chinese",
    "Russian",
    "French",
    "Spanish"
  ]

  internal let lang = [
    "en",
    "zh",
    "ru",
    "fr",
    "es"
  ]

  internal let locale = [
    "en-US",
    "zh-CN",
    "ru-RU",
    "fr-FR",
    "es-ES",
    "en-GB"
  ]

  internal let city = [
    "Cracow",
    "New York City, NY",
    "Cork",
    "Mountain View, CA"
  ]

  internal let country = [
    "Poland",
    "United States",
    "Ireland",
    "United States",
    "es-ES",
    "en-GB"
  ]

  internal let address = [
    "Stolarska 9, Cracow",
    "600 3rd Ave, New York, NY 10016, United States",
    "ADI, Hollyhill Industrial Estate, Hollyhill, Cork, Republic of Ireland.",
    "1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA"
  ]

  internal let `bool` = [
    "true",
    "false"
  ]

  internal let `color` = [
    "red",
    "green",
    "blue",
    "black",
    "purple"
  ]

  internal let tag = [
    "#travel",
    "#tech",
    "#tbt",
    "#influencermarketing"
  ]
}

internal struct ContextualIntDataSet {
  internal static let shared = Self()
  private init() {}

  internal let percent0_100 = [
    0,
    33,
    45,
    50,
    66,
    90,
    99,
    100
  ]

  internal let positive = [
    0,
    1,
    75,
    128,
    256,
    1_000_001
  ]

  internal let negative = [
    -1,
     -10,
     -100,
     -1000
  ]

  internal let smallAmount = [
    0,
    1,
    10,
    15,
    24,
    98
  ]

  internal let regularAmount = [
    0,
    100,
    128,
    200
  ]

  internal let bigAmount = [
    1000,
    1988,
    20600,
    11201,
    992019
  ]

  internal let extraBigAmount = [
    100_000,
    999_000,
    1_000_000,
    10_000_000,
    100_000_000,
    1_000_000_000
  ]

  internal let socialMediaReactions = [
    0,
    1,
    2,
    11,
    28,
    68
  ]

  internal let hugeAmountSocialMediaReactions = [
    101,
    168,
    290,
    1022,
    9975,
    12010
  ]

  internal let smallFileBytes = [
    101,
    168,
    290,
    1022,
    9975,
    12010
  ]

  internal let largeFileBytes = [
    100000000,
    222000000,
    349132411,
    900000000
  ]

  internal let entityNumber = [
    23451,
    10023,
    1,
    982345,
    2000466
  ]
}

internal struct ContextualFloatDataSet {
  internal static let shared = Self()
  private init() {}

  internal let percent0_1 = [
    0.00,
    0.33,
    0.45,
    0.50,
    0.66,
    0.90,
    0.99,
    1.00
  ]

  internal let percent0_100 = [
    0.00,
    33.01,
    45.50,
    50.00,
    66.61,
    90.00,
    99.99,
    100.00
  ]

  internal let positive = [
    0.00,
    1.11,
    75.00,
    128.56,
    256.999999,
    1_000_001.01
  ]

  internal let negative = [
    -1.00,
     -10.00,
     -100.00,
     -100.99
  ]

  internal let smallAmount = [
    0.01,
    1.01,
    10.6666667,
    15.00,
    24.11,
    98.10
  ]

  internal let regularAmount = [
    0.00,
    100.25,
    128.00,
    200.11
  ]

  internal let bigAmount = [
    1000.00,
    1988.25,
    20600.99,
    11201.98123,
    992019.00
  ]

  internal let extraBigAmount = [
    100_000.00,
    999_000.00,
    1_000_000.00,
    10_000_000.00,
    100_000_000.00,
    1_000_000_000.00
  ]
}
