//
//  EditTableViewController.swift
//  Кинопоиск
//
//  Created by Сергей Иванов on 21/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var filmMO: FilmMO?
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
        
        if let filmMO = filmMO {
            photoView.image = UIImage(data: filmMO.photo!)
            nameTextField.text = filmMO.name
            dateTextField.text = filmMO.date
            ratingTextField.text = "\(filmMO.rating)"
            discriptionTextField.text = filmMO.notes
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
       
        
        let film = Film(name: nameTextField.textValue, photo: photoView.image!, notes: discriptionTextField.textValue, rating: rt, date: dateTextField.textValue)
        
        filmMO = FilmMO(film)
   }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loadPhotoButtonTaped(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    @IBAction func textFieldChanged() {
        updateButton()
    }

}
