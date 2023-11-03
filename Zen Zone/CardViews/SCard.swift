//
//  SCard.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/23/23.
//

import SwiftUI

struct SCard: View {
    @State var item: StoreItem
    var storeManager = StoreManager.shared
    @State private var showAlert = false
    @StateObject var userModel = UserModel()

    func buyItem() {
        storeManager.boughtItem(name: item.name)
        userModel.addToBanners(banner: item.name)
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(item.name)
                    .frame(width: 50, height: 50)
                    .mask(Circle())
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(storeManager.boughtItems.contains(where: {$0 == item.name}) ? "\(item.name) ✓" : item.name)
                            .customFont(.title2, fontSize: 24)
                            .frame(alignment: .leading)
                        Spacer()
                        
                        HStack {
                            Image(systemName: "drop.halffull")
                            Text(String(item.cost))
                                .customFont(.body, fontSize: 20)
                                .frame(alignment: .trailing)
                        }
                        
                    }
                    
                    Text(item.description)
                        .customFont(.body, fontSize: 20)
                        .frame(alignment: .leading)
                    
                }

            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
            Divider()
                .background(Color.black)
        }
        .frame(height: 120)
        .onTapGesture {
            showAlert = true
        }
        .alert(isPresented: $showAlert) {
            if UserDefaults.standard.integer(forKey: "Points") >= item.cost {
                Alert(
                    title: Text("Do you want to buy: \(item.name)"),
                    message: Text("The price is \(item.cost)"),
                    primaryButton: .default(
                        Text("Buy"),
                        action: buyItem
                    ),
                    secondaryButton: .destructive(
                        Text("Cancel")
                    )
                )
            } else {
                Alert(
                    title: Text("Points insufficient"),
                    message: Text("You do not have enough points to buy this item"),
                    dismissButton: .default(Text("Ok"))
                )
            }
            
        }
        .disabled(storeManager.boughtItems.contains(where: {$0 == item.name}) ? true : false)

    }
}


