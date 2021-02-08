//
//  extension+Array+Comparable.swift
//  Dobble
//
//  Created by Alex Luna on 08/02/2021.
//

import Foundation

extension Array where Element: Comparable {
    func similarElements(as other: [Element]) -> [Element] {
        let same = self.filter() { other.contains($0) }
        return same
    }
}
