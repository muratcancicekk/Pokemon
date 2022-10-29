//
//  View+Extension.swift
//  Pokemon
//
//  Created by Murat on 29.10.2022.
//

import Foundation
import SwiftUI

private struct PrimaryLabel: ViewModifier {
    var size = Double()
    var color: Color = .black
    func body(content: Content) -> some View {
        content
            .fontWeight(.black)
            .foregroundColor(color)
            .font(.system(size: size))
    }
}
extension Text {
    func makePrimaryLabel(size: Double = 20, color: Color = .black) -> some View {
        ModifiedContent(content: self, modifier: PrimaryLabel(size: size, color: color))
    }
}
