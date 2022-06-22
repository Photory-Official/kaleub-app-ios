//
//  HomeBodyFloatingView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/23.
//

import SwiftUI

struct HomeBodyFloatingView: View {
    @State var isShowing: Bool = true
    
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
            
            if isShowing {
                Button {
                    isShowing.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 60)
                        .foregroundColor(ColorSet.primary)
                        .frame(width: 172, height: 48)
                        .overlay {
                            Text("JOIN THE ROOM")
                                .foregroundColor(.black)
                        }
                }

                Button {
                    isShowing.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 60)
                        .foregroundColor(ColorSet.primary)
                        .frame(width: 172, height: 48)
                        .overlay {
                            Text("START A ROOM")
                                .foregroundColor(.black)
                        }
                }
            }
            
            HStack {
                Spacer()
                Button {
                    isShowing.toggle()
                } label: {
                    Image("app.floating_button")
                        .resizable()
                        .frame(width: 62, height: 62)
                }
            }
        }
    }
}

struct HomeBodyFloatingView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBodyFloatingView()
    }
}
