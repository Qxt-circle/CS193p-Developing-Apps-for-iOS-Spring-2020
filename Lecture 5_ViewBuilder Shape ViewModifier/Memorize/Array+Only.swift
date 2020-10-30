//
//  Array+Only.swift
//  Memorize
//
//  Created by 王莹媛 on 2020/10/21.
//

import Foundation

extension Array {
    var only: Element?  {
        count == 1 ? first: nil
    }
}
