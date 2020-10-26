//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Qxt_circle on 2020/10/20.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
