//
//  UCard.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/23/23.
//

import SwiftUI

struct UCard: View {
    @ObservedObject var audioPlayer = AudioPlayer()
    @State var item: StoreItem
    var storeManager = StoreManager.shared
    @State private var showAlert = false
    
    func buyItem() {
        storeManager.boughtItem(name: item.name)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Image(systemName: item.image!)
                .foregroundColor(.white)
                .scaleEffect(2)
                .padding()
            Text(storeManager.boughtItems.contains(where: {$0 == item.name}) ? "\(item.name) ✓" : item.name)
                .customFont(.title2, fontSize: 18)
                .multilineTextAlignment(.center)
            Text(storeManager.boughtItems.contains(where: {$0 == item.name}) ? "Bought" : "Buy")
                .customFont(.title2, fontSize: 16)
                .multilineTextAlignment(.center)
                .onTapGesture {
                    showAlert = true
                }
            
            Text("Click to play music")
                .customFont(.caption, fontSize: 10)
                .multilineTextAlignment(.center)
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 200, height: 150)
        .background(item.color)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .onTapGesture {
            audioPlayer.playSound(soundName: item.name, soundExtension: "wav")
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
                    message: Text("You do not have enough points to buy this item (\(item.cost))"),
                    dismissButton: .default(Text("Ok"))
                )
            }
        }
        .disabled(storeManager.boughtItems.contains(where: {$0 == item.name}) ? true : false)
        
    }
}

#Preview {
    UCard(item: StoreManager.shared.musicItems[0])
}
