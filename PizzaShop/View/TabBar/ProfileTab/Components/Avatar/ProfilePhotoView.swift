//
//  ProfilePhotoView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 16.05.23.
//

import SwiftUI

struct ProfilePhotoView: View {
    @State var image = UIImage(systemName: "photo")!
    @State var isPickerShow = false

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(20)
            
            Button {
                //
                isPickerShow.toggle()

            } label: {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.burgundy)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2))
                    Image(systemName: "camera.fill")
                        .foregroundColor(.white)
                }
                
            }
            .offset(x: 15, y: 15)
            .sheet(isPresented: $isPickerShow) {
                ImagePicker(image: $image)
            }
        }
    }
}

struct ProfilePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoView()
    }
}
