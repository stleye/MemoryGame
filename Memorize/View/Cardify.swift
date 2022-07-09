//
//  Cardify.swift
//  Memorize
//
//  Created by Sebastian Tleye on 09/07/2022.
//

import SwiftUI

struct Cardify: AnimatableModifier {

    var rotation: Angle

    var animatableData: Double {
        get { rotation.degrees }
        set { rotation = Angle(degrees: newValue) }
    }

    init(isFaceUp: Bool) {
        self.rotation = isFaceUp ? Angle.zero : Angle.degrees(180)
    }

    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if rotation.degrees < 90 {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            } else {
                shape.fill()
            }
            content.opacity(rotation.degrees < 90 ? 1 : 0)
        }
        .rotation3DEffect(rotation, axis: (0, 1, 0))
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }

}

extension View {
    
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
    
}
