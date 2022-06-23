//
//  UploadRecipeViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/15.
//

import Foundation
import UIKit
import MaterialComponents.MaterialBottomSheet
import CropViewController

class UploadRecipeViewController: UIViewController {
    
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ThumbNail: UIImageView!
    @IBOutlet var Stars: [UIButton]!
    @IBOutlet weak var RecipeTitle: UITextField!
    @IBOutlet weak var FoodName: UITextField!
    @IBOutlet weak var RecipeDescView: UIView!
    @IBOutlet weak var RecipeDesc: UITextView!
    @IBOutlet weak var CookTime: UILabel!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var TableViewHeight: NSLayoutConstraint!
    static var Category: [String] = []
    
    var starPoint = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.TableViewHeight.constant = self.TableView.contentSize.height + 10
            self.TableView.reloadData()
        }
    }
    
    func configure() {
        // Set TableView
        TableView.delegate = self
        TableView.dataSource = self
        
        TableView.rowHeight = UITableView.automaticDimension
        TableView.estimatedRowHeight = 600
    
        // ThumbNail openGallery
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openGallary))
        ThumbNail.addGestureRecognizer(tapGesture)
        ThumbNail.isUserInteractionEnabled = true
        
        // Set View
        ThumbNail.layer.cornerRadius = 5
        RecipeDesc.layer.cornerRadius = 5
        RecipeDescView.layer.cornerRadius = 5
        RecipeDescView.layer.borderColor = UIColor(red: 113, green: 113, blue: 113).cgColor
        RecipeDesc.layer.borderWidth = 1
        
        // Set TextView
        RecipeDesc.text = "레시피를 설명해주세요.  (최대40글자)"
        RecipeDesc.delegate = self
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

// Button Action
extension UploadRecipeViewController {
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
    
    @IBAction func TimeSlider(_ sender: UISlider) {
        let value = sender.value
        CookTime.text = String(Int(value)) + "분"
    }
}

// Open Gallery
extension UploadRecipeViewController: UINavigationControllerDelegate, CropViewControllerDelegate {
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
        self.dismiss(animated: true, completion: nil)
    }
    
    func presentCropViewController(image:UIImage) {
        let cropViewController = CropViewController(image: image)
        cropViewController.delegate = self
        cropViewController.aspectRatioPreset = .presetSquare
        cropViewController.aspectRatioPickerButtonHidden = true
        cropViewController.aspectRatioLockEnabled = true
        cropViewController.rotateButtonsHidden = true
        cropViewController.resetButtonHidden = true
        self.present(cropViewController, animated: true, completion: nil)
    }
    
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        ThumbNail.image = image
        self.dismiss(animated: true, completion: nil)
    }
}

extension UploadRecipeViewController: UIImagePickerControllerDelegate {
    @objc func openGallary() {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.modalPresentationStyle = .fullScreen
        self.present(imagePicker, animated: true, completion: nil)
    }
}

//MARK: - textView 관련 메서드
extension UploadRecipeViewController {
    func textViewSetupView(_ textView: UITextView) {
        textCheck(textView,"레시피를 설명해주세요.  (최대40글자)")
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
extension UploadRecipeViewController: UITextViewDelegate {
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

//MARK: - UITableViewDelegate
extension UploadRecipeViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension UploadRecipeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TableView.dequeueReusableCell(withIdentifier: RecipeUploadTableViewCell.identifier, for: indexPath) as? RecipeUploadTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure()
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        return cell
    }
}

