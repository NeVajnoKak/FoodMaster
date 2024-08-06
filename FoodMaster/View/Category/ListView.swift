////
////  ListView.swift
////  FoodMaster
////
////  Created by Erkebulan Massainov on 06.08.2024.
////
//
//import SwiftUI
//
//struct ListView: View {
//    var body: some View {
//        VStack{
//            HStack (spacing: 4){
//                Button () {
//                    
//                } label: {
//                    ZStack{
//                        Rectangle()
//                            .frame(maxWidth: 40, maxHeight: 40)
//                            .foregroundColor(ColorPalette.navChips)
//                            .cornerRadius(15)
//                        Image(systemName: "rectangle.grid.1x2")
//                            .fontWeight(.bold)
//                            .foregroundColor(ColorPalette.greenColor)
//                    }
//                }
//                Spacer()
//            }
//            .padding([.leading, .trailing])
//            Divider()
//            
//            GeometryReader { geo in
//                ScrollView (showsIndicators: false) {
//                    LazyVGrid(columns: columns){
//                        ForEach(TemporaryData.products) { product in
//                            
//                        }
//                    }
//                   
//                }
//            }
//            
//        }
//    }
//}
//
//#Preview {
//    ListView()
//}
