//
//  ViewController.swift
//  Кинопоиск
//
//  Created by Сергей Иванов on 13/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var photoView: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var notesView: UITextView!
    
    
    var film: Film?
    
    override func viewDidLoad() {
        updateUI()
    }
    
    func updateUI() {
        guard let film = film else { return }
        
        photoView.setImage(film.photo, for: .normal)
       photoView.imageView?.contentMode = .scaleAspectFit
        
        nameLabel.text = film.name
        dateLabel.text = film.date
        ratingLabel.text = "\(film.rating)"
        notesView.text = film.notes
        
        if film.rating > 7.0 {
            ratingLabel.textColor = UIColor.green
        } else {
            if film.rating < 5.0 {
                ratingLabel.textColor = UIColor.red
            } else {
                ratingLabel.textColor = UIColor.black
            }
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "image" {
            let controller = segue.destination as! ImageViewController
            controller.image = film!.photo
        }
        
        if segue.identifier == "edit" {
            let controller = segue.destination as! EditTableViewController
            controller.film = film
            controller.editingFilm = true
            controller.navigationItem.title = "Edit"
        }
    }
    
    

}
