//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Svidt on 10/07/2023.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator {
        
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    }
    
//      Type this to trigger a helpful error message, that will fill out the correct code:
//      typealias UIViewControllerType = PHPickerViewController
    
}
