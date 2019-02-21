//
//  EditTableViewController.swift
//  Кинопоиск
//
//  Created by Сергей Иванов on 21/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController {
    
    var film: Film?
    var editingFilm: Bool?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var discriptionTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateButton()
        
        if let film = film {
            photoView.image = film.photo
            nameTextField.text = film.name
            dateTextField.text = film.date
            ratingTextField.text = "\(film.rating)"
            discriptionTextField.text = film.notes
        }
     
    }
    
    func updateButton() {
        saveButton.isEnabled = !nameTextField.textValue.isEmpty
            && !dateTextField.textValue.isEmpty
            && !ratingTextField.textValue.isEmpty
            && !discriptionTextField.textValue.isEmpty
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rt = Float(ratingTextField.textValue) ?? 0
        film = Film(
            name: nameTextField.textValue,
            photo: photoView.image!,
            notes: discriptionTextField.textValue,
            rating: rt,
            date: dateTextField.textValue)
    }
    
    
    @IBAction func textFieldChanged() {
        updateButton()
    }

}
