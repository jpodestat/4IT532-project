//
//  CatsListItemView.swift
//  4IT532-project
//
//  Created by Jan Podestát on 01.06.2023.
//

import SwiftUI

struct CatsListItemView: View {
    let cat: Cat
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(
                url: cat.imageUrl) { image in
                    image
                        .resizable()
                        .frame(width: 110, height: 110)
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                }.frame(width: 110, height: 110)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(cat.name).font(.title)
                
                Text(cat.description)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(16)
        .shadow(radius: 30)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }

}


struct CatsListItemView_Previews: PreviewProvider {
    static var previews: some View {
        CatsListItemView(cat: Cat(id: "id", wikipediaUrl: nil, description: "desc", name: "name", origin: "origin", lifeSpan: "10", temperament: "ifiknow", indoor: 0, imageUrl: URL(string: "")!))
    }
}
