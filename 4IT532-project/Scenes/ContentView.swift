//
//  ContentView.swift
//  4IT532-project
//
//  Created by Jan Podestát on 31.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CatsListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
