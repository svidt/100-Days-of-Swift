//
//  ContentView.swift
//  Instafilter
//
//  Created by Svidt on 05/07/2023.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    
    @State private var blurAmount = 0.0
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.yellow
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
                .blur(radius: blurAmount)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    showingConfirmation = true
                }
                .padding()
                .border(backgroundColor, width: 5)
                .cornerRadius(10)
                .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                    Button("Red") { backgroundColor = .red }
                    Button("Green") { backgroundColor = .green }
                    Button("blue") { backgroundColor = .blue }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Select a new color")
                }
            
            Slider(value: $blurAmount, in: 0...20)
            
            Button("Random Amount") {
                blurAmount = Double(.random(in: 0...20))
            }
            
        }
        .onAppear(perform: loadImage)
        .onChange(of: blurAmount) { newValue in
            print("New value is \(newValue)")
        }
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "Example") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage
        currentFilter.radius = 1000
        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
