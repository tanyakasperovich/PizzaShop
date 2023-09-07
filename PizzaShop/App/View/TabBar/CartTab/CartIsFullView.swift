//
//  CartIsFullView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 18.05.23.
//

import SwiftUI

struct CartIsFullView: View {
    // MARK: - PROPERTIES
    //      @EnvironmentObject var sharedData: SharedDataModel
    
    // Delete Option...
    // @State var showDeleteOption: Bool = false
    
    
    
    @StateObject var viewModel: CartViewModel
    
    // MARK: - BODY
    var body: some View {
               List {
                    ForEach(viewModel.positions) { position in
                        PositionCardView(position: position)
                            .swipeActions{
                                Button {
                                    viewModel.positions.removeAll { pos in
                                        pos.id == position.id
                                    }
                                } label: {
                                    Text("Удалить")
                                }.tint(.redDarkTextColor)
                            }
                    }
            }
            .listStyle(SidebarListStyle())
//               .listStyle(.plain)

        VStack {
            HStack {
                Text("Итого:")
                Spacer()
                Text("\(self.viewModel.cost) $")
                    .fontWeight(.bold)
            }
            //.padding()
            
            HStack(spacing: 25) {
                Button {
                    
                } label: {
                    Text("Отменить")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(RoundedRectangleShape(color: .redDarkTextColor, radius: 25))
                }
                
                NavigationLink {
                    
                } label: {
                    Text("Заказать")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangleShape(color: .greenDarkTextColor, radius: 25))
                }
            }
        }
        .padding()
        
        
        //        VStack {
        //            HStack{
        //                NavigationLink {
        //                  //  MenuView()
        //                } label: {
        //                    Image(systemName: "plus.rectangle.fill")
        //                        .font(.title2)
        //                        .foregroundColor(Color("Orange"))
        //                //        .shadow(color: (Color("Vinous")).opacity(0.6),radius: 4, x: -4, y: 4)
        ////                        .overlay(
        ////                            Image(systemName: "plus.rectangle.fill")
        ////                                .frame(width: 35, height: 35)
        ////                                .foregroundColor( Color("Orange"))
        ////                                .shadow(color: Color.white, radius: 3, x: 7, y: 7)
        ////                        )
        ////                        .overlay(
        ////                            Image(systemName: "plus.rectangle.fill")
        ////                                .foregroundColor( Color("Orange"))
        ////                                .shadow(radius: 3, x: -7, y: -7)
        ////                        )
        ////                       .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
        ////
        //                }
        //
        //               Spacer()
        //
        //                Button {
        //                    withAnimation{
        //                        showDeleteOption.toggle()
        //                    }
        //                } label: {
        //                    Image(systemName: "trash")
        //                        .foregroundColor( Color("Orange"))
        //                        .font(.title2)
        //                }
        //            }
        //
        //        // Displaying Products...
        //            ScrollView(.vertical, showsIndicators: true) {
        //
        //            // For Designing...
        //            ForEach($sharedData.cartProducts){$position in
        //
        //                HStack(spacing: 0){
        //
        //                    if showDeleteOption{
        //
        //                        Button {
        //                            deleteProduct(product: position)
        //                        } label: {
        //                            Image(systemName: "minus.circle.fill")
        //                                .font(.title2)
        //                                .foregroundColor(.red)
        //                        }
        //                        .padding(.trailing)
        //                    }
        //
        //                    CartView(product: $position)
        //                }
        //            }
        //        }
        //        .padding(.top, 10)
        //        .padding(.horizontal)
        //
        //           Spacer()
        //
        //            VStack {
        //                HStack {
        //
        //                    Text("Total")
        //                        .font(.body)
        //                        .fontWeight(.semibold)
        //
        ////                                        Text(sharedData.getTotalPrice())
        ////                                            .font(.title2)
        ////                                            .foregroundColor(Color("Orange"))
        //                }
        //
        //                // Заказать
        //                Button {
        //
        ////                                        let order = Order(userId: AuthService.shared.currentUser!.uid,
        ////                                                          date: Date(),
        ////                                                          status: OrderStatus.new.rawValue)
        ////                                        order.positions = self.viewModel.position
        //
        //                } label: {
        //                    Text("Checkout")
        //                        .font(.title2)
        //                        .foregroundColor(.white)
        //                        .padding(.vertical, 18)
        //                        .frame(maxWidth: .infinity)
        //                        .background(
        //                            RoundedRectangle(cornerRadius: 25)
        //                            .foregroundColor(Color("Orange"))
        //                            .shadow(color: (Color("Vinous")).opacity(0.6),radius: 4, x: -4, y: 4)
        //                            .overlay(
        //                                RoundedRectangle(cornerRadius: 25, style: .continuous)
        //                                    .stroke(Color("Orange"), lineWidth: 4)
        //                                    .shadow(color: Color.white, radius: 6, x: 7, y: 7)
        //                            )
        //                            .overlay(
        //                                RoundedRectangle(cornerRadius: 25, style: .continuous)
        //                                    .stroke(Color("Orange"), lineWidth: 4)
        //                                    .shadow(radius: 6, x: -7, y: -7)
        //                            )
        //                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        //
        //                        )
        //                        .cornerRadius(15)
        //                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
        //                }
        //                .padding(.vertical)
        //            }
        //            .padding(.horizontal, 25)
        //    }
        //    }
        //
        //    func deleteProduct(product: Product){
        //
        //        if let index = sharedData.cartProducts.firstIndex(where: {
        //            currentProduct in
        //            return product.id == currentProduct.id
        //        }){
        //
        //            let _ = withAnimation{
        //                // removing...
        //                sharedData.cartProducts.remove(at: index)
        //            }
        //        }
        //    }
    }
    
}


struct CartIsFullView_Previews: PreviewProvider {
    static var previews: some View {
        CartIsFullView(viewModel: CartViewModel.shared)
    }
}

//
//struct CartView1: View {
//    // MARK: - PROPERTIES
//
//    @Binding var product: Product
//
//    // MARK: - BODY
//
//    var body: some View {
//        HStack(spacing: 15){
//
//            Image(product.imageURL)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 100, height: 100)
//
//            VStack(alignment: .leading, spacing: 8) {
//
//                Text(product.title)
//                    .font(.body)
//                    .lineLimit(1)
//
//                Text(product.subtitle)
//                    .font(.body)
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color("Orange"))
//
//                // Quantity Buttons...
//                HStack(spacing: 10){
//
//                    Text("Quantity")
//                        .font(.body)
//                        .foregroundColor(.gray)
//
//                    Button {
//                        product.quantity = (product.quantity > 0 ? (product.quantity - 1) : 0)
//                    } label: {
//                        Image(systemName: "minus")
//                            .font(.caption)
//                            .foregroundColor(.white)
//                            .frame(width: 20, height: 20)
//                            .background(Color("Vinous"))
//                            .cornerRadius(4)
//                    }
//
//                    Text("\(product.quantity)")
//                        .font(.body)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.black)
//
//                    Button {
//                        product.quantity += 1
//                    } label: {
//                        Image(systemName: "plus")
//                            .font(.caption)
//                            .foregroundColor(.white)
//                            .frame(width: 20, height: 20)
//                            .background(Color("Vinous"))
//                            .cornerRadius(4)
//                    }
//
//                }
//            }
//        }
//        .padding(.horizontal, 10)
//        .padding(.vertical,10)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(
//            Color.white
//                .cornerRadius(10)
//        )
//    }
//}
