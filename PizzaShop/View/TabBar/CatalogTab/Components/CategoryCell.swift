//
//  CategoryCell.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 12.05.23.
//
//
//import SwiftUI
//
//struct CategoryCell: View {
//    var category: Category
//    @Binding var isSelectedCell: Bool
//    var body: some View {
//
//            Text(category.rawValue)
//            .font(.body)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(
//                    RoundedRectangle(cornerRadius: 65)
//                    .foregroundColor(.greenDarkTextColor)
//                )
//    }
//}
//
//struct CategoryCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryCell(category: .pizza, isSelectedCell: .constant(false))
//    }
//}
