extension MutableCollection where Self: RandomAccessCollection {
    public mutating func sort<Value>(
        by keyPath: KeyPath<Element, Value>
    ) where Value: Comparable {
        self.sort(by: { $0[keyPath: keyPath] < $1[keyPath: keyPath] })
    }
}
