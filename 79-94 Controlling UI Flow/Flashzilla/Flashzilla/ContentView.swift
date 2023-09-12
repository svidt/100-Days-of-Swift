//
//  ContentView.swift
//  Flashzilla
//
//  Created by Kristian Emil Hansen Svidt on 13/09/2023.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    
    @State private var engine: CHHapticEngine?

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(.green)
                    .frame(width: 64, height: 64)
                    .onTapGesture(perform: simpleSuccess)
                    .padding()
                Circle()
                    .fill(.yellow)
                    .frame(width: 64, height: 64)
                    .onTapGesture(perform: simpleWarning)
                    .padding()
                Circle()
                    .fill(.red)
                    .frame(width: 64, height: 64)
                    .onTapGesture(perform: simpleError)
                    .padding()
                
                
            }
            RoundedRectangle(cornerRadius: 10)
                .fill(.purple)
                .frame(width: 64*3, height: 64)
                .onTapGesture(perform: complexSuccess)
                .padding()
        }
        .onAppear(perform: prepareHaptics)
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play \(error.localizedDescription)")
        }
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    func simpleWarning() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    func simpleError() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
