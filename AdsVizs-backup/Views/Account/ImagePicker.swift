//
//  ImagePicker.swift
//  AdsVizs_Backup
//
//  Created by Siya Yang on 2020-07-26.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI
import Combine

class ImagePicker : ObservableObject{
    // to make only have one image picker to work on
    static let shared: ImagePicker = ImagePicker()
    private init(){}
    
    let view = ImagePicker.View()
    let coordinator = ImagePicker.Coordinator()
    
    let willChange = PassthroughSubject<Image?, Never>()
    
    @Published var image: Image? = nil {
        //as soon as we set the image, we need to make sure the image is not = nil
        didSet{
            //if it is then pass through the subject
            if image != nil {
                willChange.send(image)
            }
        }
    }
}


extension ImagePicker{
    //combing uikit
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        //this trigger the cancel button when hit to change the avatar
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // send to swiftui view
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            
            //from uiimage to image in swiftui
            ImagePicker.shared.image = Image (uiImage: image)
            picker.dismiss(animated: true)
        }
    }
}


extension ImagePicker{
    //this is to adapt the swift ui
    struct  View: UIViewControllerRepresentable {
        
        
        //this func is required
        func makeCoordinator() -> Coordinator {
            return ImagePicker.shared.coordinator
        }
        
        //this func is required
        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker.View>) -> UIImagePickerController {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = context.coordinator
            return imagePickerController
        }
        
        //this func is required
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker.View>) {
            
        }
    }
}

