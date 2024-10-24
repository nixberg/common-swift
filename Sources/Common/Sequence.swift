extension Sequence {
    public func mapWhile<ElementOfResult, E>(
        _ transform: (Element) throws(E) -> ElementOfResult?
    ) throws(E) -> [ElementOfResult]? {
        var result: [ElementOfResult] = []
        result.reserveCapacity(underestimatedCount)

        var iterator = self.makeIterator()

        while let element = iterator.next() {
            guard let newElement = try transform(element) else {
                return nil
            }
            result.append(newElement)
        }

        return result
    }

    public func sorted<Value>(
        by keyPath: KeyPath<Element, Value>
    ) -> [Element] where Value: Comparable {
        self.sorted(by: { $0[keyPath: keyPath] < $1[keyPath: keyPath] })
    }
}
