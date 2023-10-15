//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Eric Fletcher on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var messageString = ""
    
    @State private var imageName = ""
    
    @State private var imageNumber = 0
    
    var body: some View {
        
        
        
        
        VStack {
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            
            
            
            
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
                .padding()
            
            Spacer()
            
                
            
          
                Button("Show Message") {
                 
                    
                    let message1 = "You Are Awesome!"
                    let message2 = "You Are Great"
                  
                  
                    messageString = (messageString == message1 ? message2 : message1)
                 

                  
                    
                    // This restets the images to the beginning after 9
                    imageName = "image\(imageNumber)"
                    imageNumber = imageNumber + 1
                 
                    if imageNumber > 9 {
                        imageNumber = 0
                    }
                   
                    
                    
                    
                }
                .buttonStyle(.borderedProminent)
                
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
