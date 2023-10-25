//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Eric Fletcher on 10/12/23.
//

import SwiftUI
import AVFAudio




struct ContentView: View {
    
    @State private var messageString = ""
    
    @State private var imageName = ""
    
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    
    @State private var audioPlayer: AVAudioPlayer!
    
    @State private var lastSoundNumber = -1
    
    @State private var soundIsOn = true
    
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
            
            
            HStack {
                
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {_ in
                        if audioPlayer != nil && audioPlayer.isPlaying  {
                            audioPlayer.stop()
                            
                        }
                    }
                
                Spacer()
                
                Button("Show Message") {
                    
                    let messages = ["You Are Great!",
                                    "You Are Awesome!",
                                    "You can do it!",
                                    "Don't Stop Keep Going!",
                                    "Beileve In YourSelf!",
                                    "Quitting Is Not An Option!",
                                    "You Make Me Smile!"]
                    
                    // generate a random messagNumber to use as an index
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                    messageString = messages[lastMessageNumber]
                    
                    
                    // This restets the images to the beginning after 9
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: 9)
                    imageName = "image\(lastImageNumber)"
                    
                    // create random soound
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: 5)
                    
                    if soundIsOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("OceanBlue"))
                
            }
            
        }
        .padding()
    }
    
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
    
    
    
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName)
        else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer =  try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
