//
//  WriteReview.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/24.
//

import Foundation
import UIKit
import CropViewController

class WriteReviewViewController: UIViewController {
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var WriteReview: UILabel!
    @IBOutlet weak var Desc: UILabel!
    @IBOutlet weak var PhotoUpload: UILabel!
    @IBOutlet weak var Count: UILabel!
    @IBOutlet weak var ReviewText: UITextView!
    @IBOutlet weak var OkBtn: UILabel!
    @IBOutlet weak var Send: UIView!
    @IBOutlet var Stars: [UIButton]!
    var starPoint = 1
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        // Set CollectionView
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        // Set Font
        WriteReview.font = UIFont.NotoSansCJKkr(type: .medium, size: 16)
        Desc.font = UIFont.NotoSansCJKkr(type: .regular, size: 8)
        ReviewText.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        PhotoUpload.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        Count.font = UIFont.NotoSansCJKkr(type: .regular, size: 12)
        OkBtn.font = UIFont.NotoSansCJKkr(type: .medium, size: 18)
        
        // Set View
        ReviewText.layer.borderWidth = 1
        ReviewText.layer.cornerRadius = 5
        ReviewText.layer.borderColor = UIColor(red: 112, green: 112, blue: 112).cgColor
        
        // Set Event
        let tapped = UITapGestureRecognizer(target: self, action: #selector(sendReview))
        Send.addGestureRecognizer(tapped)
        
        // Set Keyboard
        let tapGuesterHideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGuesterHideKeyboard)
        
        // Set TextView
        ReviewText.text = "리뷰를 작성해 주세요."
        ReviewText.delegate = self
    }
    
    @objc private func sendReview() {
        print("click")
    }
}

// Button Action
extension WriteReviewViewController {
    
    @IBAction func StarClick(_ sender: UIButton) {
        starPoint = sender.tag
        for i in 1..<5 {
            if i<=starPoint {
                DispatchQueue.main.async {
                    self.Stars[i].setImage(UIImage(named: "Star"), for: .normal)
                }
            } else {
                DispatchQueue.main.async {
                    self.Stars[i].setImage(UIImage(named: "StarBlank"), for: .normal)
                }
            }
        }
    }
}
//MARK: - CollectionViewDelegate
extension WriteReviewViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "showGallery", sender: nil)
        }
    }
}

//MARK: - CollectionViewDataSource
extension WriteReviewViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure()
        
        return cell
    }
}

// Open Gallery
extension WriteReviewViewController: CropViewControllerDelegate {
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

extension WriteReviewViewController: UIImagePickerControllerDelegate {
    func openGallary() {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.modalPresentationStyle = .fullScreen
        present(imagePicker, animated: true, completion: nil)
    }
}

// MARK: - Keyboard 관련 메서드
extension WriteReviewViewController {

    // Keyboard handler
    @objc func hideKeyboard() {
        ReviewText.resignFirstResponder()
    }
}

// MARK: - TextView 관련 메서드
extension WriteReviewViewController {
    func textViewSetupView(_ textView: UITextView) {
        textCheck(textView,"리뷰를 작성해 주세요.")
    }
    
    func textCheck(_ textView: UITextView, _ text: String) {
        if textView.text == text {
            textView.text = ""
            textView.textColor = UIColor.black
        } else if textView.text == "" {
            textView.text = text
            textView.textColor = UIColor.lightGray
        }
    }
}

//MARK: - UITextViewDelegate 관련 메서드
extension WriteReviewViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textViewSetupView(textView)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textViewSetupView(textView)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
}
