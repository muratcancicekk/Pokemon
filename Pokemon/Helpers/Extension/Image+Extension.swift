//
//  Image+Extension.swift
//  Pokemon
//
//  Created by Murat on 29.10.2022.
//

import Foundation
import SwiftUI

extension Image {
    func myImageModifier() -> some View {
        self
            .resizable()
            .frame(width: 120, height: 120)
            .cornerRadius(8)
   }
}
