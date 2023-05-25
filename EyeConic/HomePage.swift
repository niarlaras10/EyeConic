//
//  HomePage.swift
//  Eye-conic
//
//  Created by Rachmaniar Larasati on 19/05/23.
//

import Foundation
import SwiftUI

struct HomePage: View {
    @State private var selection: Int? = nil
    @State private var isPulsing = false
    
    var body: some View {
        ZStack {
            Image("Homepage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("EyeConic")
                        .font(.system(size: 50, weight: .bold))
                        .padding(20)
                        .foregroundColor(.black)

                }
                Text("Specially crafted experience for you who want to be the next icon in this glass-y area")
                    .font(.title2)
                    .italic()
                    .padding(20)
                    .foregroundColor(.black)
                Text("Try on glasses with less hassle!")
                    .font(.title2)
                    .italic()
                    .padding(20)
                    .foregroundColor(.black)

                Spacer()
            }
            .padding()
            
            VStack {
                Spacer()
                
                NavigationLink(destination: ContentView(), tag: 1, selection: $selection) {
                    EmptyView()
                }
                
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                        isPulsing.toggle()
                    }
                    selection = 1
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 250, height: 70)
                            .cornerRadius(30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.white, lineWidth: isPulsing ? 4 : 0)
                                    .scaleEffect(isPulsing ? 1.5 : 1)
                                    .opacity(isPulsing ? 0.5 : 1)
                            )
                        
                        Image(systemName: "arkit")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 60)
            }
        }
    }
}



struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
