//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Abdurahman on 15.09.2026.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            //.modifier(Title())
            .titleStyle()
    }
}

#Preview {
    ContentView()
}
