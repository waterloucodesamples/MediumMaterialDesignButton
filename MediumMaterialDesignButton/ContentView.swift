//
//  ContentView.swift
//  MediumMaterialDesignButton
//
//  Created by Water Lou on 14/3/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let columns = [
            GridItem(spacing: 0),
            GridItem(spacing: 0)
        ]
                
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                
                LazyVGrid(columns: columns, spacing: 16) {
                    Button("Primary") {}.buttonStyle(MaterialButtonStyle())
                    Button("Secondary") {}.buttonStyle(MaterialButtonStyle(color: .secondary))
                    Button("Success") {}.buttonStyle(MaterialButtonStyle(color: .success))
                    Button("Danger") {}.buttonStyle(MaterialButtonStyle(color: .danger))
                    Button("Warning") {}.buttonStyle(MaterialButtonStyle(color: .warning))
                    Button("Info") {}.buttonStyle(MaterialButtonStyle(color: .info))
                    Button("Light") {}.buttonStyle(MaterialButtonStyle(color: .light))
                    Button("Dark") {}.buttonStyle(MaterialButtonStyle(color: .dark))
                }

                Spacer()

                Button("Border Danger") {}.frame(maxWidth: .infinity).buttonStyle(MaterialButtonStyle(color: .danger, maxWidth: true)).padding()

                HStack {
                    Button("Border Danger") {}.buttonStyle(MaterialButtonStyle(color: .danger, maxWidth: true))
                    Spacer()
                    Button("Border Danger") {}.buttonStyle(MaterialButtonStyle(color: .danger, maxWidth: true))
                }.padding()
                


            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
