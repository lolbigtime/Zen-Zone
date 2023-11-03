//
//  BCard.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/23/23.
//

import SwiftUI

struct BCard: View {
    @State var item: StoreItem
    var storeManager = StoreManager.shared
    @State private var showAlert = false
    
    func buyItem() {
        storeManager.boughtItem(name: storeManager.boughtItems.contains(where: {$0 == item.name}) ? "\(item.name) ✓" : item.name)
    }
    
    var body: some View {
        VStack {
            Circle()
                .stroke(item.color, lineWidth: 5.0) // Border color and width
                .background(Circle().foregroundColor(Color.clear)) // Transparent fill
                .frame(width: 80, height: 80) // Size of the circle
            Text(storeManager.boughtItems.contains(where: {$0 == item.name}) ? "\(item.name) ✓" : item.name)
                .customFont(.title2, fontSize: 16)
            HStack {
                Image(systemName: "drop.halffull")
                Text(String(item.cost))
                    .customFont(.body, fontSize: 20)
                    .frame(alignment: .trailing)
            }

        }
        .padding(5)
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

#Preview {
    BCard(item: StoreManager.shared.borderItems[0])
}
