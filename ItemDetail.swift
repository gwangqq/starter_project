//
//  ItemDetail.swift
//  StartProject
//
//  Created by 박광규 on 2021/03/20.
//

import SwiftUI

struct ItemDetail: View {
    // If you wnat to share something on your app, you have to use environmentObject
    @EnvironmentObject var order: Order
    let item: MenuItem
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
           
            Text(item.description)
                .padding()
            
            Button("Order This"){
                order.add(item: item)
            }
            .font(.headline)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
            }
        }
}
