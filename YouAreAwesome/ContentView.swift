//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Eric Fletcher on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var messageString = ""
    
    
    
    var body: some View {
        
        
        
        
        VStack {
            
            Spacer()
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .italic()
                .padding()
                .frame( height: 150)
                .frame(maxWidth: .infinity)
            //                .border(.orange, width: 1)
                .padding()
            
            Spacer()
            
            
            
            HStack {
                Button("Awesome") {
                    // action performed when button is pressed
                    messageString = "You Are Awesome!"
                    
                    
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Button("Great") {
                    // action performed when button is pressed
                    messageString = "You Are Great!"
                }
                
                .buttonStyle(.borderedProminent)
            }
            //            .border(.purple, width: 5)
            .padding()
            .tint(Color("OceanBlue"))
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
