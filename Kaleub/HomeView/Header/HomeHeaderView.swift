//
//  HomeHeaderView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct HomeHeaderView: View {
    // NOTE: 피그마에서 어떤 색을 차용해야하는지, 확실치 않아서 colorLiteral로 스포이드!
    let fillColor = Color(#colorLiteral(red: 0.9019607902, green: 0.9019607902, blue: 0.9019607902, alpha: 1))
    let shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.26)
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                // user profile
                HStack {
                    Image("app.profile")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                    
                    VStack(alignment: .leading) {
                        Text("사용자")
                            .fontWeight(.semibold)
                        Text("방 갯수 0개 | 활동 뱃지 0개")
                            .font(.caption2)
                    }
                }
                
                Spacer()
                
                Image("app.chervon.forward")
                    .resizable()
                    .frame(width: 16, height: 23, alignment: .center)
                    .padding(.trailing, 32)
            }
            .padding([.vertical], 20)
            .padding(.leading, 12)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(fillColor)
                    .frame(height: 100)
                    .shadow(color: .black, radius: 4, x: 0, y: 4)
            }
            .padding([.horizontal], 16)
        }
        
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}
