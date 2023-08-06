import Randomable

internal struct TestModelA: Identifiable {
    internal var id: Int { contentA }
    internal let contentA: Int
    internal let contentB: String
    internal var contentC: Double
}

internal struct TestModelB: Hashable {
    internal let contentA: Int
    internal let contentB: String
    internal var contentC: Double
}

internal struct TestModelC: Hashable & Identifiable {
    internal var id: Int { contentA }
    internal let contentA: Int
    internal let contentB: String
    internal var contentC: Double
}

extension TestModelA: Randomable {
    static func random(
        _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
        self.init(
            contentA: .random(),
            contentB: .random(),
            contentC: .random()
        )
    }
}

extension TestModelB: Randomable {
    static func random(
        _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
        self.init(
            contentA: .random(),
            contentB: .random(),
            contentC: .random()
        )
    }
}

extension TestModelC: Randomable {
    static func random(
        _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
        self.init(
            contentA: .random(),
            contentB: .random(),
            contentC: .random()
        )
    }
}
