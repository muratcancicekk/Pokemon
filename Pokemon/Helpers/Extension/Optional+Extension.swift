//
//  Optional+Extension.swift
//  Pokemon
//
//  Created by Murat on 28.10.2022.
//

import Foundation
import Swi
extension Optional {
    func or(defaultValue: T) -> T {
        switch(self) {
            case .None:
                return defaultValue
            case .Some(let value):
                return value
        }
    }
}
