//
//  BioAuth.swift
//  BucketList
//
//  Created by Svidt on 26/07/2023.
//

import LocalAuthentication
import SwiftUI

struct BioAuth: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    // Authenticated successfully
                    isUnlocked = true
                } else {
                    // There was a problem
                }
            }
        } else {
            // No biometrics
        }
    }
    
}

struct BioAuth_Previews: PreviewProvider {
    static var previews: some View {
        BioAuth()
    }
}
