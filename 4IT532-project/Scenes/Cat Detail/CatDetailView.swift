//
//  CatDetailView.swift
//  4IT532-project
//
//  Created by Jan Podestát on 02.06.2023.
//

import SwiftUI

struct CatDetailView: View {
    @State var isWikiPresented = false
    let cat: Cat
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: cat.imageUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity)
                    
                    createCatDetail(cat)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 16)
            }
        }
        .sheet(isPresented: $isWikiPresented, content: {
            WebView(url: cat.wikipediaUrl!)
        })
        .navigationTitle(cat.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if cat.wikipediaUrl != nil{
                    Button(action: openWiki) {
                        HStack {
                            Text("Wikipedia ")
                            Image(systemName: "safari")
                        }
                    }
                }
            }
        }
    }
}

private extension CatDetailView {
    func createCatDetail(_ cat: Cat) -> some View {
        VStack(alignment: .center, spacing: 8) {
                    createSingleInfo("Origin", cat.origin)
                    createSingleInfo("Life Spane", cat.lifeSpan + " years")
                    createSingleInfo("Temperament", cat.temperament)
                    createSingleInfo("Indoor", cat.indoor == 0 ? "No" : "Yes")
                    createSingleInfo("Description", cat.description)
                }
        .padding(.horizontal, 8)
    }
    
    func createSingleInfo(_ title: String, _ text: String) -> some View {
        VStack {
            Text(title).font(.title2)
            
            Text(text)
        }
    }
    
    func openWiki() -> Void {
        isWikiPresented = true
    }
}


struct CatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CatDetailView(cat: Cat(id: "id", wikipediaUrl: nil, description: "desc", name: "name", origin: "origin", lifeSpan: "10", temperament: "ifiknow", indoor: 0, imageUrl: URL(string: "")!))
    }
}
