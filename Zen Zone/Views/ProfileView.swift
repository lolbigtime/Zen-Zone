//
//  ProfileView.swift
//  Zen Zone
//
//  Created by Tai Wong on 9/20/23.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @ObservedObject var quoteModel: QuoteModel    
    @ObservedObject var userModel: UserModel

    @AppStorage("Points") var points = UserDefaults.standard.integer(forKey: "Points")
    @EnvironmentObject var isBottomSheetManager: SheetManager
    @State var isLoading = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color("Background").ignoresSafeArea()
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        ZStack {
                            Color("Background 2")
                            VStack {
                                VStack {
                                    Spacer()
                                        .frame(height: 60)
                                    ZStack {
                                        Image(uiImage: userModel.profileImage ?? UIImage(named: "testimage")!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: geo.size.width / 2.6, height: geo.size.width / 2.6)
                                            .clipShape(Circle())
                                        VStack {
                                            HStack() {
                                                Spacer()
                                                Button(action: {
                                                    withAnimation(.spring) {
                                                        isBottomSheetManager.present()
                                                    }
                                                    
                                                }) {
                                                    ZStack {
                                                        Circle()
                                                            .stroke(Color.black, lineWidth: 2) // Adjust the color and lineWidth as needed
                                                            .frame(width: geo.size.width / 12 + 4, height: geo.size.width / 12 + 4) // Add 4 to adjust for the border

                                                        Image(systemName: "plus")
                                                            .resizable()
                                                            .font(.title)
                                                            .padding(10)
                                                            .background(Color.white.opacity(0.7))
                                                            .foregroundColor(.black)
                                                            .clipShape(Circle())
                                                            .frame(width: geo.size.width / 12, height: geo.size.width / 12)
                                                    }
                                                }
                                                
                                            }
                                            Spacer()
                                        }
                                    }
                                    .frame(width: geo.size.width / 2.6, height: geo.size.width / 2.6)
                                    
                                   
                                    Text(userModel.username ?? "")
                                        .customFont(.largeTitle, fontSize: 34)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding(.horizontal, 20)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                                .background(Color("Background"))
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 0,
                                        bottomLeadingRadius: 20,
                                        bottomTrailingRadius: 20,
                                        topTrailingRadius: 0
                                    )
                                )
                                
                                HStack(spacing: 40) {
                                    VStack {
                                        Text(String(userModel.banners.count))
                                            .customFont(.title2, fontSize: 24)
                                        Text("Badges")
                                            .customFont(.caption, fontSize: 12)
                                    }
                                    VStack {
                                        Text(String(points))
                                            .customFont(.title2, fontSize: 24)
                                        Text("Droplets")
                                            .customFont(.caption, fontSize: 12)
                                    }
                                    VStack {
                                        Text(String(userModel.banners.count))
                                            .customFont(.title2, fontSize: 24)
                                        Text("Banners")
                                            .customFont(.caption, fontSize: 12)
                                    }
                                }
                                .foregroundColor(.white)
                                .padding()
                            }
                            
                        }
                        .clipShape(
                            .rect(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 20,
                                bottomTrailingRadius: 20,
                                topTrailingRadius: 0
                            )
                        )
                        VStack {
                            ZStack {
                                KFImage(URL(string: "https://picsum.photos/1000")!)
                                    .resizable()
                                    .frame(height: geo.size.height / 4)
                                    .cornerRadius(20)
                                    .overlay(darkOverlay.cornerRadius(20), alignment: .center)
                                VStack {
                                    Text("\"" + (quoteModel.quotes?[0].q ?? "") + "\"")
                                        .customFont(.subheadline2, fontSize: 20)
                                        .padding(.horizontal, 20)
                                        .padding(.top, 30)
                                    HStack {
                                        Spacer()
                                        Text("- " + (quoteModel.quotes?[0].a ?? ""))
                                            .italic()
                                    }
                                    .padding(.horizontal)
                                    .padding(.bottom, 10)
                                    
                                }
                                .foregroundColor(.white)

                                
                            }
                            
                            
                            
                        }
                        .padding()
                        
                        Text("Badges")
                            .customFont(.largeTitle, fontSize: 26)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                        
                    }
                    
                }
                .ignoresSafeArea()
                
                
                if isBottomSheetManager.action.isPresented {
                    ZStack {
                        if isLoading {
                            LoadingView()
                        }
                        Color.black.opacity(0.3)
                            .onTapGesture {
                                withAnimation {
                                    isBottomSheetManager.dismiss()
                                }
                            }
                    }
                    .ignoresSafeArea()

                    
                }

            }
        }
        .overlay(alignment: .bottom) {
            if isBottomSheetManager.action.isPresented {
                BottomMenu(userModel: userModel, bottomSheetManager: isBottomSheetManager, isLoading: $isLoading)
            }
        }
        .ignoresSafeArea()
    }
    
    private var darkOverlay: some View {
        Color(.black)
            .opacity(0.3)
            .blur(radius: 1)
    }
}

#Preview {
    ProfileView(quoteModel: QuoteModel(), userModel: UserModel())
        .environmentObject(SheetManager())
}
