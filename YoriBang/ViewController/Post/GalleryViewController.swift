//
//  GalleryViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/24.
//

import Foundation
import UIKit
import CropViewController

class GalleryViewController: UIViewController {
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

// Open Gallery
extension GalleryViewController: UINavigationControllerDelegate, CropViewControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Error: \(info)")
            return
        }
        dismiss(animated: true, completion: nil)
        self.presentCropViewController(image: selectedImage)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.isNavigationBarHidden = false
        dismiss(animated: true, completion: nil)
    }
    
    func presentCropViewController(image:UIImage) {
        let cropViewController = CropViewController(image: image)
        cropViewController.delegate = self
        cropViewController.aspectRatioPreset = .presetSquare
        cropViewController.aspectRatioPickerButtonHidden = true
        cropViewController.aspectRatioLockEnabled = true
        cropViewController.rotateButtonsHidden = true
        cropViewController.resetButtonHidden = true
        present(cropViewController, animated: true, completion: nil)
    }
    
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
//        ThumbNail.image = image
        
        dismiss(animated: true, completion: nil)
        
    }
}

extension GalleryViewController: UIImagePickerControllerDelegate {
    func openGallary() {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.modalPresentationStyle = .fullScreen
        present(imagePicker, animated: true, completion: nil)
    }
}
