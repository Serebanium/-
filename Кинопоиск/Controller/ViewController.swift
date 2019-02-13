//
//  ViewController.swift
//  Кинопоиск
//
//  Created by Сергей Иванов on 13/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var notesView: UILabel!
    
    var film: Film?
    
    override func viewDidLoad() {
        updateUI()
    }
    
    func updateUI() {
        guard let film = film else { return }
        
        photoView.image = film.photo
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

}
