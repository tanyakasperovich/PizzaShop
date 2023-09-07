//
//  ProfilePhotoView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 16.05.23.
//

import SwiftUI

struct ProfilePhotoView: View {
    @State var image: UIImage
    @State var isPickerShow = false

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
           Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .background(Color.white)
                .clipShape(Circle())
                .frame(width: 120, height: 120)

               
            Button {
                isPickerShow.toggle()
            } label: {
                Image(systemName: "camera.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(CircleShape(color: .greenDarkTextColor))
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .overlay(Circle().stroke(Color.redDarkTextColor, lineWidth: 1))
            }
            .offset(x: 15, y: 15)
            .sheet(isPresented: $isPickerShow) {
                ImagePicker(image: $image)
            }
        }
       .padding(.trailing, 15)
       .padding(.bottom, 15)
    }
}

struct ProfilePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoView(image: UIImage(systemName: "person")!)
    }
}
