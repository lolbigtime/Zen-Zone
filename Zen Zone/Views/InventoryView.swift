//
//  InventoryView.swift
//  Zen Zone
//
//  Created by Andruw Lin on 10/15/23.
//

import SwiftUI
struct InventoryView: View {
    @EnvironmentObject var globalData: GlobalData
    var body: some View {
        VStack{
            Text("Items: \(globalData.inventoryitems.joined(separator: ", "))")
        }
    }
    
    struct InventoryView_Previews: PreviewProvider {
        static var previews: some View {
            InventoryView()
                .environmentObject(GlobalData())
        }
    }
}
