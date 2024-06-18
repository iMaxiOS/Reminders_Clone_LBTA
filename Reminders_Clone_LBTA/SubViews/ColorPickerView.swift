//
//  ColorPickerView.swift
//  Reminders_Clone_LBTA
//
//  Created by iMac on 18.06.2024.
//

import SwiftUI

struct ColorPickerView: View {
    
    @Binding var selectedColor: Color
    
    let colors: [Color] = [.red, .green, .orange, .pink, .teal, .blue]
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                ZStack {
                    Circle().fill()
                        .foregroundStyle(color)
                        .padding(2)
                    Circle()
                        .strokeBorder(selectedColor == color ? .gray : .clear, lineWidth: 4)
                        .scaleEffect(CGSize(width: 1.2, height: 1.2))
                }
                .onTapGesture {
                    withAnimation(.linear) {
                        selectedColor = color
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 100)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    ColorPickerView(selectedColor: .constant(.blue))
}
