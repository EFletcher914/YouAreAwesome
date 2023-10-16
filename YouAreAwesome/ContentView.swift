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
    
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    var body: some View {
        
        
        
        
        VStack {
            
            
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
            
            
            
            
            
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            
            
            Spacer()
            
            
            
            
            Button("Show Message") {
                
                let messages = ["You Are Great!",
                                "You Are Awesome!",
                                "You can do it!",
                                "Don't Stop Keep Going!",
                                "Beileve In YourSelf!",
                                "Quitting Is Not An Option!",
                                "You Make Me Smile!"]
                
                
                
                // if messageNumber == laastMessageNumber {
                //keep generating a new random messageNumber
                // untik you get a messageNumber!= lastMessageNumber
                // Set messageString to message[messageNumber]
                // update the lastMessageNumber with messageNumber
                
                
                
                
                // generate a random messagNumber to use as an index
                
                var messageNumber: Int
                
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                
                messageString = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                // This restets the images to the beginning after 9
                
                
                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 0...9)
                    
                }while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                    
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
