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
    
    
    var filmMO: FilmMO?
    
    override func viewDidLoad() {
        updateUI()
    }
    
    func updateUI() {
        guard let filmMO = filmMO else { return }
        
        photoView.setImage(UIImage(data: filmMO.photo!), for: .normal)
       photoView.imageView?.contentMode = .scaleAspectFit
        
        nameLabel.text = filmMO.name
        dateLabel.text = filmMO.date
        ratingLabel.text = "\(filmMO.rating)"
        notesView.text = filmMO.notes
        
        if filmMO.rating > 7.0 {
            ratingLabel.textColor = UIColor.green
        } else {
            if filmMO.rating < 5.0 {
                ratingLabel.textColor = UIColor.red
            } else {
                ratingLabel.textColor = UIColor.black
            }
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "image" {
            let controller = segue.destination as! ImageViewController
            controller.image = UIImage(data: filmMO!.photo!)
        }
        
        if segue.identifier == "edit" {
            let controller = segue.destination as! EditTableViewController
            controller.filmMO = filmMO
            controller.editingFilm = true
            controller.navigationItem.title = "Edit"
        }
    }
    
    

}
