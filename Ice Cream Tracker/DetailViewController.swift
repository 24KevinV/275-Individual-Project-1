//
//  DetailViewController.swift
//  Ice Cream Tracker
//
//  Created by Kevin Veronneau on 11/3/21.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var townField: UITextField!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var ratingStepper: UIStepper!
    @IBOutlet var dateLabel: UILabel!
    
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
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
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        item.name = nameField.text ?? ""
        item.town = townField.text ?? ""
        item.rating = Int(ratingStepper.value)
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
