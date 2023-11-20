//
//  ContentView.swift
//  11-8
//
//  Created by Kenny Luchau on 11/20/23.
//

import SwiftUI
struct ContentView: View {


    @State var searchText = "Champion Wiki"
    let champArray = ["Ashe", "Jhin", "Vayne", "Blitzcrank", "Janna", "Xerath", "Azir", "Zed", "Yasuo", "Warwick", "Master Yi", "Poppy"]
    var body: some View {
        NavigationView{
            ChampListView(champions: champArray)
        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Look for a pet") {
            Text("Bow").searchCompletion("Ashe")
            Text("Fist").searchCompletion("Blitzcrank")
            Text("God").searchCompletion("Janna")
            Text("Dog").searchCompletion("Warwick")
            Text("Blade Master").searchCompletion("Master Yi")
            Divider()
            ForEach(champArray.filter {$0.hasPrefix(searchText)}, id: \.self) { name in
                Text(name)
            }
        }
    }
}
struct ChampListView: View {
    let champions: [String]
    var body: some View {
        List(champions, id: \.self) { x in
            Text(x)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
