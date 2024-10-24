extension Dictionary {
    public func dropAll(
        where shouldBeRemoved: (Element) throws -> Bool
    ) rethrows -> [Key: Value] {
        try self.filter({ try !shouldBeRemoved($0) })
    }
}
