//
//  DetailViewController.swift
//  Ice Cream Tracker
//
//  Created by Kevin Veronneau on 11/3/21.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var townField: UITextField!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var ratingStepper: UIStepper!
    @IBOutlet var notesField: UITextView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func choosePhotoSource(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alertController.modalPresentationStyle = .popover
        alertController.popoverPresentationController?.barButtonItem = sender
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
                let imagePicker = self.imagePicker(for: .camera)
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(cameraAction)
        }
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { _ in
            let imagePicker = self.imagePicker(for: .photoLibrary)
            imagePicker.modalPresentationStyle = .popover
            imagePicker.popoverPresentationController?.barButtonItem = sender
            self.present(imagePicker, animated: true, completion: nil)
        }
        alertController.addAction(photoLibraryAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func deleteItem(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to delete '\(item.name)'", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            print("Deleting item")
//            ItemsViewController.tableView
//            let item = itemStore.allItems[indexPath.row]
//
//                self.itemStore.removeItem(item)
//
//                self.imageStore.deleteImage(forKey: item.itemKey)
//
//                tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        alertController.addAction(deleteAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    var imageStore: ImageStore!
    
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        
        imageStore.setImage(image, forKey: item.itemKey)
        
        imageView.image = image
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePicker(for sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        return imagePicker
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        townField.text = item.town
        ratingLabel.text = "Rating: \(item.rating)/15"
        ratingStepper.minimumValue = 1
        ratingStepper.maximumValue = 15
        ratingStepper.value = Double(item.rating)
        notesField.text = item.notes
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        
        let key = item.itemKey
        
        let imageToDisplay = imageStore.image(forKey: key)
        imageView.image = imageToDisplay
        
        self.notesField.layer.borderWidth = 1.0
        self.notesField.layer.borderColor = UIColor.systemGray5.cgColor
        self.notesField.layer.cornerRadius = 4
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        item.name = nameField.text ?? ""
        item.town = townField.text ?? ""
        item.rating = Int(ratingStepper.value)
        item.notes = notesField.text ?? ""
    }
    
    @IBAction func updateRating(_ sender: UIStepper) {
//        if sender.value >= 15 {
//            sender.value = 15
//        } else if sender.value <= 1 {
//            sender.value = 1
//        }
//        item.rating = Int(sender.value)
        ratingLabel.text = "Rating: \(Int(sender.value))/15"
    }
    
    
}
