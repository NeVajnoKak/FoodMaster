//
//  TileView.swift
//  FoodMaster
//
//  Created by Erkebulan Massainov on 06.08.2024.
//

import SwiftUI

struct GridView: View {
    @State private var itemCount = 1
//    let columns = Array(repeating: GridItem(.flexible()), count: itemCount)
    let flagFinder = CountryFlagFinder()
    @State private var selectedButtonIndex = 1
    @State private var selectedButton:Int? = nil
    @State private var isSelected = true
    
    @State private var quantity = 1
    @State private var cargo = 0.1
    
    @State private var price = 59.2
    var backgroundForItemCount2: some View {
            AnyView(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
                    .shadow(color: ColorPalette.cardShadow, radius: 8)
                    .opacity(0.2)
            )
        }

        var clearBackground: some View {
            AnyView(Color.clear)
        }
    @State private var priceQ = 60
    
    var body: some View {
        
        
        VStack{
            HStack (spacing: 4){
                Button () {
                    itemCount = itemCount == 2 ? 1 : 2
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(maxWidth: 40, maxHeight: 40)
                            .foregroundColor(ColorPalette.navChips)
                            .cornerRadius(15)
                        if itemCount == 2 {
                            Image(systemName: "square.grid.2x2")
                                .fontWeight(.bold)
                                .foregroundColor(ColorPalette.greenColor)
                        }
                        if itemCount == 1 {
                            Image(systemName: "rectangle.grid.1x2")
                                .fontWeight(.bold)
                                .foregroundColor(ColorPalette.greenColor)
                        }
                        
                    }
                }
                Spacer()
            }
            .padding([.leading, .trailing])
            Divider()
            GeometryReader { geo in
                ScrollView (showsIndicators: false) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: itemCount )){
                        ForEach(TemporaryData.products) { product in
                            
                            let priceString = String(format: "%.2f", product.price)
                            let priceComponents = priceString.split(separator: ".")
                            let integerPart = String(priceComponents[0])
                            let fractionalPart = String(priceComponents[1])
                            VStack{
                                if itemCount == 1 {
                                    HStack{
                                            Image("\(product.image)")
                                                .resizable()
                                                .frame(width: geo.size.width * 0.4)
                                                .aspectRatio(1,contentMode: .fit)
                                                .overlay(alignment: .topLeading){
                                                    if product.quantity < 100 {
                                                        Text("Успейте купить")
                                                            .font(.system(size: 10))
                                                            .foregroundColor(.white)
                                                            .background(
                                                                //                                                        RoundedRectangle(cornerRadius: 30)
                                                                //                                                            .fill(.purple)
                                                                //                                                            .frame(width: 100, height: 20)
                                                                RoundedCorners(color: .purple, tl: 90, tr: 90, bl: 0, br: 90)
                                                                    .frame(width: 100, height: 30)
                                                            )
                                                            .padding(.top, 9)
                                                            .padding(.leading, 13)
                                                    }
                                                }
                                                .overlay(alignment: .bottomTrailing) {
                                                    if product.discount {
                                                        Text("25%")
                                                            .foregroundColor(ColorPalette.redColor)
                                                            .fontWeight(.bold)
                                                            .background(
                                                                RoundedRectangle(cornerRadius: 6)
                                                                    .frame(width:40,height: 20)
                                                                    .foregroundColor(.white)
                                                            )
                                                            .padding(.trailing,5)
                                                    }
                                                    
                                                    
                                                }
                                                
                                        
                                        VStack(alignment: .leading){
                                            HStack{
                                                VStack(alignment: .leading){
                                                    HStack{
                                                        Image("Star")
                                                            .frame(width: 2)
                                                        
                                                        Text("\(String(format: "%.1f", product.rating))")
                                                            .font(.system(size: 14))
                                                            .opacity(0.8)
                                                        Text("| 19 отзывов")
                                                            .font(.system(size: 14))
                                                            .opacity(0.8)
                                                    }
                                                    
                                                    .padding(.leading, 16)
                                                    
                                                    Text("\(product.name)")
                                                        .font(.system(size: 15))
                                                        .opacity(0.8)
                                                        .padding(.leading , 10)
                                                    HStack{
                                                        Text(product.country)
                                                            .foregroundColor(ColorPalette.textColor)
                                                            .font(.system(size: 13))
                                                            .opacity(0.6)
                                                            .padding(.leading , 10)
                                                        
                                                        Text("\(flagFinder.flag(for: product.flag) ?? "")")
                                                            .padding(.trailing , 10)
                                                        Spacer()
                                                    }
                                                    .padding(.top, 3)
                                                }
//                                                Spacer()
                                                VStack{
                                                    Button() {
                                                        
                                                    } label: {
                                                        Image("order")
                                                            .resizable()
                                                            .frame(width: 20, height: 20)
                                                        
                                                    }
                                                    
                                                    Button() {
                                                        
                                                    } label: {
                                                        Image("heart")
                                                            .resizable()
                                                            .frame(width: 20, height: 20)
                                                    }
                                                }
                                            }
                                            
                                            if selectedButton == product.id {
                                                VStack(spacing: 0){
                                                    ZStack{
                                                        RoundedRectangle(cornerRadius: 8)
                                                            .frame(width: 200, height: geo.size.height * 0.05)
                                                            .foregroundColor(ColorPalette.buttonBackground)
                                                        HStack(spacing: 0){
                                                            Button(){
                                                                selectedButtonIndex = 0
                                                                print(selectedButtonIndex)
                                                            } label : {
                                                                ZStack{
                                                                    RoundedRectangle(cornerRadius: 6)
                                                                        .foregroundColor(selectedButtonIndex == 0 ? .white : ColorPalette.buttonBackground)
                                                                    Text("Шт")
                                                                        .font(.system(size: 13))
                                                                        .foregroundColor(selectedButtonIndex == 0 ? .black : ColorPalette.textColor.opacity(0.6))
                                                                }
                                                            }
                                                            .frame(width: 100, height: 30)
                                                            //                                                .background(.blue)
                                                            
                                                            
                                                            Button(){
                                                                selectedButtonIndex = 1
                                                                print("1")
                                                            } label : {
                                                                ZStack{
                                                                    RoundedRectangle(cornerRadius: 8)
                                                                        .foregroundColor(selectedButtonIndex == 1 ? .white : ColorPalette.buttonBackground)
                                                                    Text("Кг")
                                                                        .font(.system(size: 13))
                                                                        .foregroundColor(selectedButtonIndex == 1 ? .black : ColorPalette.textColor.opacity(0.6))
                                                                }
                                                            }
                                                            .frame(width: 100, height: 30)
                                                            //                                                .background(.green)
                                                        }
                                                    }
                                                    
                                                    ZStack{
                                                        RoundedRectangle(cornerRadius: 30)
                                                            .foregroundColor(ColorPalette.greenColor)
                                                            .frame(width: 200, height: 50)
                                                        HStack{
                                                            
                                                            Button() {
                                                                if selectedButtonIndex == 0 && quantity > 1{
                                                                    quantity -= 1
                                                                }
                                                                if selectedButtonIndex == 1 && cargo > 0.1{
                                                                    cargo -= 0.1
                                                                }
                                                                
                                                                
                                                            } label: {
                                                                ZStack{
                                                                    Text("-")
                                                                        .font(.system(size: 30))
                                                                        .fontWeight(.bold)
                                                                }
                                                            }
                                                            .padding()
                                                            Spacer()
                                                            VStack{
                                                                selectedButtonIndex == 1 ?
                                                                Group {
                                                                    Text("\(String(format:("%.1f") ,cargo)) кг")
                                                                        .font(.system(size: 15))
                                                                        .fontWeight(.bold)
                                                                    Text("~\(String(format:("%.2f"),cargo * price)) ₽")
                                                                        .font(.system(size: 10))
                                                                        .opacity(0.8)
                                                                }
                                                                :
                                                                Group {
                                                                    Text("\(quantity) шт")
                                                                        .font(.system(size: 15))
                                                                        .fontWeight(.bold)
                                                                    Text("~\(quantity * priceQ) ₽")
                                                                        .font(.system(size: 10))
                                                                        .opacity(0.8)
                                                                }
                                                                
                                                            }
                                                            Spacer()
                                                            Button() {
                                                                if selectedButtonIndex == 1{
                                                                    cargo += 0.1
                                                                }
                                                                if selectedButtonIndex == 0 {
                                                                    quantity += 1
                                                                }
                                                            } label: {
                                                                ZStack{
                                                                    Text("+")
                                                                        .font(.system(size: 30))
                                                                        .fontWeight(.bold)
                                                                }
                                                            }
                                                            .padding()
                                                        }
                                                        .foregroundColor(.white)
                                                    }
                                                
                                                    
                                                }
                                                .padding(.leading, 10)
                                            }
                                            else  {
                                                VStack{
                                                    HStack{
                                                        VStack(alignment: .leading){
                                                            HStack{
                                                                Group {
                                                                    Text(integerPart)
                                                                        .font(.system(size: 18))
                                                                        .fontWeight(.bold)
                                                                    +
                                                                    Text(" \(fractionalPart) ")
                                                                        .font(.system(size: 16))
                                                                        .fontWeight(.bold)
                                                                }
                                                                
                                                                Image("PerAmountIcon")
                                                                    .frame(width: 1)
                                                                Spacer()
                                                            }
                                                            HStack{
                                                                Text("\(NSString(format:"%.2f", product.price))")
                                                                    .font(.system(size: 10))
                                                                    .opacity(0.6)
                                                                    .strikethrough(true, color: .gray)
                                                                
                                                            }
                                                        }
                                                        .padding(.leading , 10)
                                                        Button() {
                                                            selectedButton = product.id
                                                        } label: {
                                                            ZStack{
                                                                RoundedRectangle(cornerRadius: 50)
                                                                    .frame(width: 48, height: 36)
                                                                    .foregroundColor(ColorPalette.greenColor)
                                                                Image("Cart")
                                                            }
                                                        }
                                                        .padding(.trailing, 5)
                                                        
                                                    }
                                                    .padding(.bottom, 20)
                                                    
                                                    
                                                }
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                    Divider()
                                    
                                }
                                if itemCount == 2 {
                                    
                                    
                                    VStack{
                                        
                                        Image("\(product.image)")
                                            .resizable()
                                            .aspectRatio(1,contentMode: .fit)
                                            .overlay(alignment: .topTrailing) {
                                                VStack{
                                                    Button() {
                                                        
                                                    } label: {
                                                        Image("order")
                                                            .resizable()
                                                            .frame(width: 20, height: 20)
                                                        
                                                    }
                                                    Button() {
                                                        
                                                    } label: {
                                                        Image("heart")
                                                            .resizable()
                                                            .frame(width: 20, height: 20)
                                                    }
                                                }
                                                
                                                .background(RoundedRectangle(cornerRadius: 30)
                                                    .fill(.white)
                                                    .opacity(0.2)
                                                    .frame(width: 50, height: 75)
                                                )
                                                .padding(.trailing, 15)
                                                .padding(.top, 15)
                                            }
                                            .overlay(alignment: .topLeading){
                                                if product.quantity < 100 {
                                                    Text("Успейте купить")
                                                        .font(.system(size: 10))
                                                        .foregroundColor(.white)
                                                        .background(
                                                            //                                                        RoundedRectangle(cornerRadius: 30)
                                                            //                                                            .fill(.purple)
                                                            //                                                            .frame(width: 100, height: 20)
                                                            RoundedCorners(color: .purple, tl: 90, tr: 90, bl: 0, br: 90)
                                                                .frame(width: 100, height: 30)
                                                        )
                                                        .padding(.top, 9)
                                                        .padding(.leading, 13)
                                                }
                                            }
                                            .overlay(alignment: .bottomLeading){
                                                
                                                HStack{
                                                    Image("Star")
                                                        .frame(width: 2)
                                                    
                                                    Text("\(String(format: "%.1f", product.rating))")
                                                        .font(.system(size: 11))
                                                        .opacity(0.8)
                                                }
                                                .background(
                                                    RoundedRectangle(cornerRadius: 6)
                                                        .frame(width:40,height: 20)
                                                        .foregroundColor(.white)
                                                )
                                                .padding(.leading, 16)
                                            }
                                            .overlay(alignment: .bottomTrailing) {
                                                if product.discount {
                                                    Text("25%")
                                                        .foregroundColor(ColorPalette.redColor)
                                                        .fontWeight(.bold)
                                                        .background(
                                                            RoundedRectangle(cornerRadius: 6)
                                                                .frame(width:40,height: 20)
                                                                .foregroundColor(.white)
                                                        )
                                                        .padding(.trailing,5)
                                                }
                                                
                                            }
                                        
                                        HStack{
                                            Text(product.name)
                                                .font(.system(size: 10))
                                                .opacity(0.8)
                                                .padding(.leading , 10)
                                            Spacer()
                                        }
                                        HStack{
                                            Text(product.country)
                                                .foregroundColor(ColorPalette.textColor)
                                                .font(.system(size: 13))
                                                .opacity(0.6)
                                                .padding(.leading , 10)
                                            
                                            Text("\(flagFinder.flag(for: product.flag) ?? "")")
                                                .padding(.trailing , 10)
                                            Spacer()
                                        }
                                        .padding(.top, 3)
                                        
                                    }
                                    
                                    
                                    Spacer()
                                    if selectedButton == product.id {
                                        VStack(spacing: 0){
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 8)
                                                    .frame(width: geo.size.width * 0.44, height: geo.size.height * 0.05)
                                                    .foregroundColor(ColorPalette.buttonBackground)
                                                HStack(spacing: 0){
                                                    Button(){
                                                        selectedButtonIndex = 0
                                                        print(selectedButtonIndex)
                                                    } label : {
                                                        ZStack{
                                                            RoundedRectangle(cornerRadius: 6)
                                                                .foregroundColor(selectedButtonIndex == 0 ? .white : ColorPalette.buttonBackground)
                                                            Text("Шт")
                                                                .font(.system(size: 13))
                                                                .foregroundColor(selectedButtonIndex == 0 ? .black : ColorPalette.textColor.opacity(0.6))
                                                        }
                                                    }
                                                    .frame(width: 85, height: 30)
                                                    //                                                .background(.blue)
                                                    
                                                    
                                                    Button(){
                                                        selectedButtonIndex = 1
                                                        print("1")
                                                    } label : {
                                                        ZStack{
                                                            RoundedRectangle(cornerRadius: 8)
                                                                .foregroundColor(selectedButtonIndex == 1 ? .white : ColorPalette.buttonBackground)
                                                            Text("Кг")
                                                                .font(.system(size: 13))
                                                                .foregroundColor(selectedButtonIndex == 1 ? .black : ColorPalette.textColor.opacity(0.6))
                                                        }
                                                    }
                                                    .frame(width: 85, height: 30)
                                                    //                                                .background(.green)
                                                }
                                            }
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 30)
                                                    .foregroundColor(ColorPalette.greenColor)
                                                    .frame(width: 170, height: 32)
                                                HStack{
                                                    
                                                    Button() {
                                                        if selectedButtonIndex == 0 && quantity > 1{
                                                            quantity -= 1
                                                        }
                                                        if selectedButtonIndex == 1 && cargo > 0.1{
                                                            cargo -= 0.1
                                                        }
                                                        
                                                        
                                                    } label: {
                                                        ZStack{
                                                            Text("-")
                                                                .font(.system(size: 20))
                                                                .fontWeight(.bold)
                                                        }
                                                    }
                                                    .padding()
                                                    VStack{
                                                        selectedButtonIndex == 1 ?
                                                        Group {
                                                            Text("\(String(format:("%.1f") ,cargo)) кг")
                                                                .font(.system(size: 15))
                                                                .fontWeight(.bold)
                                                            Text("~\(String(format:("%.2f"),cargo * price)) ₽")
                                                                .font(.system(size: 10))
                                                                .opacity(0.8)
                                                        }
                                                        :
                                                        Group {
                                                            Text("\(quantity) шт")
                                                                .font(.system(size: 15))
                                                                .fontWeight(.bold)
                                                            Text("~\(quantity * priceQ) ₽")
                                                                .font(.system(size: 10))
                                                                .opacity(0.8)
                                                        }
                                                        
                                                    }
                                                    
                                                    Button() {
                                                        if selectedButtonIndex == 1{
                                                            cargo += 0.1
                                                        }
                                                        if selectedButtonIndex == 0 {
                                                            quantity += 1
                                                        }
                                                    } label: {
                                                        ZStack{
                                                            Text("+")
                                                                .font(.system(size: 20))
                                                                .fontWeight(.bold)
                                                        }
                                                    }
                                                    .padding()
                                                }
                                                .foregroundColor(.white)
                                            }
                                            
                                        }
                                    }
                                    else  {
                                        VStack{
                                            HStack{
                                                VStack(alignment: .leading){
                                                    HStack{
                                                        Group {
                                                            Text(integerPart)
                                                                .font(.system(size: 18))
                                                                .fontWeight(.bold)
                                                            +
                                                            Text(" \(fractionalPart) ")
                                                                .font(.system(size: 16))
                                                                .fontWeight(.bold)
                                                        }
                                                        
                                                        Image("PerAmountIcon")
                                                            .frame(width: 1)
                                                        Spacer()
                                                    }
                                                    HStack{
                                                        Text("\(NSString(format:"%.2f", product.price))")
                                                            .font(.system(size: 10))
                                                            .opacity(0.6)
                                                            .strikethrough(true, color: .gray)
                                                        
                                                    }
                                                }
                                                .padding(.leading , 10)
                                                Button() {
                                                    selectedButton = product.id
                                                } label: {
                                                    ZStack{
                                                        RoundedRectangle(cornerRadius: 50)
                                                            .frame(width: 48, height: 36)
                                                            .foregroundColor(ColorPalette.greenColor)
                                                        Image("Cart")
                                                    }
                                                }
                                                .padding(.trailing, 5)
                                                
                                            }
                                            .padding(.bottom, 20)
                                            
                                            
                                        }
                                    }
                                }
                            }
                            
                            .foregroundColor(ColorPalette.textColor)
                            .frame(height: itemCount == 1 ? geo.size.height * 0.25 : geo.size.height * 0.45)
                            
                            .background(
                                Group {
                                    if itemCount == 2 {
                                        RoundedRectangle(cornerRadius: 30)
                                            .fill(Color.white)
                                            .shadow(color: ColorPalette.cardShadow, radius: 8)
                                            .opacity(0.2)
                                    } else {
                                        Color.clear
                                    }
                                }
                            )
                                    
                                }
                    }
                    .padding([.leading, .trailing])
                    .padding(.top, 2)
                    
                }
                
            }
            
            .frame(maxWidth: .infinity)
            
        }
        .background(.white)
       
        
        
        
    }
}

#Preview {
    GridView()
}
