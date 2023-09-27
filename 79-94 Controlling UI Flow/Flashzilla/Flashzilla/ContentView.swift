//
//  ContentView.swift
//  Flashzilla
//
//  Created by Svidt on 13/09/2023.
//

import CoreHaptics
import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}

func withOptionalAnimation<Result>(_ animation: Animation? = .default, body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct ContentView: View {
    
    @State private var cards = Array<Card>(repeating: Card.example, count: 10)

    @State private var engine: CHHapticEngine?
    @Environment(\.scenePhase) var scenePhase
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        ForEach(0..<cards.count, id: \.self) { index in
                            CardView(card: cards[index]) {
                                withAnimation {
                                    removeCard(at: index)
                                }
                            }
                            .stacked(at: index, in: cards.count)
                            
                        }
                    }
                }
                
                if differentiateWithoutColor {
                    VStack {
                        Spacer()
                        
                        HStack {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                            Spacer()
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                    }
                }
                
            }
            
            VStack {
                
                Text("Check transparency")
                    .padding()
                    .background(reduceTransparency ? .black : .black.opacity(0.5))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                
                Text("Tap to scale")
                    .scaleEffect(scale)
                    .onTapGesture {
                        withOptionalAnimation {
                            scale *= 1.5
                        }
                    }
                
                HStack {
                    if accessibilityDifferentiateWithoutColor {
                        Image(systemName: "checkmark.circle")
                    }
                    
                    Text("Success")
                }
                .padding()
                .background(accessibilityDifferentiateWithoutColor ? .black : .green)
                .foregroundColor(.white)
                .clipShape(Capsule())
                
                Text("Scene Phase")
                    .padding()
                    .onChange(of: scenePhase) { newPhase in
                        if newPhase == .active {
                            print("Active")
                        } else if newPhase == .inactive {
                            print("Inactive")
                        } else if newPhase == .background {
                            print("Background")
                        }
                    }
                Text("Hello!")
                    .onReceive(timer) { time in
                        if counter == 5 {
                            timer.upstream.connect().cancel()
                        } else {
                            print("The time is now \(time)")
                        }
                        counter += 1
                    }
                
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
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
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
