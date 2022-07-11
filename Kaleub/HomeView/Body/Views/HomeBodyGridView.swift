//
//  HomeBodyGridView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct HomeBodyGridView: View {
    let title: String
    let date: String
    let participantsCount: Int
    
    init(title: String, date: String, participantsCount: Int) {
        self.title = title
        self.date = date
        self.participantsCount = participantsCount
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundColor(ColorSet.primary)
            .frame(height: 175)
            .overlay {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text(title)
                    
                    HStack {
                        Text(date + " ~")
                            .font(.caption)
                        
                        Spacer()
                        
                        Text("\(participantsCount)명")
                            .font(.caption)
                    }
                }
                .padding()
            }
    }
}

struct HomeBodyGridView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeBodyGridView(
            title: "그 해 우리는",
            date: "2022.06.15",
            participantsCount: 1
        )
    }
}
