//
//  InfoView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 26.06.23.
//

import SwiftUI

struct InfoView: View {
   
    var sectionInfoTitle = ["About", "Technical",  "Help",  "FAQ"]
    var body: some View {
     //   VStack(spacing: 1) {
        Section(header: HStack() {
            Image(systemName: "info.circle")
            Text("Information")
        }.foregroundColor(.burgundy).bold()) {
            ForEach(sectionInfoTitle, id: \.self) {item in
                NavigationLink {
                    Text(item)
                } label: {
                    Text(item)
                }
            }
        }
   // }
    }
//    // Avoiding new Structs...
//    func customNavigationLink<Detail: View>(title: String,@ViewBuilder content: @escaping ()->Detail)->some View{
//
//        NavigationLink {
//            content()
//        } label: {
//
//            HStack{
//
//                Text(title)
//                    .font(.body)
//                    .fontWeight(.semibold)
//
//                Spacer()
//
//                Image(systemName: "chevron.right")
//            }
//            .foregroundColor(.black)
//            .padding()
//            .background(
//                RoundedRectangleShape(color: .white, radius: 12)
//            )
//            .padding(.horizontal)
//            .padding(.vertical, 10)
//        }
//    }
    
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
