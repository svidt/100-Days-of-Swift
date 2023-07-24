//
//  LoadingState.swift
//  BucketList
//
//  Created by Svidt on 24/07/2023.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct ContentView_TEST: View {
    
    var loadingState = LoadingState.loading
    
    var body: some View {
        if loadingState == .loading {
            LoadingView()
        } else if loadingState == .success {
            SuccessView()
        } else if loadingState == .failed {
            FailedView()
        }
        
        //            // Case style also works great and looks better
        //            switch loadingState {
        //            case .loading:
        //                LoadingView()
        //            case .success:
        //                SuccessView()
        //            case .failed:
        //                FailedView()
        //            }
    }
}
