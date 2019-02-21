//
//  FilmViewController+UITadleViewDataSource.swift
//  Кинопоиск
//
//  Created by Сергей Иванов on 21/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

extension FilmViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FilmTableViewCell
        let film = films[indexPath.row]
        
        configure(cell: cell, with: film)
        return cell
    }
    
    func configure(cell: FilmTableViewCell, with film: Film) {
        cell.photoImageView.image = film.photo
        cell.nameLabel.text = film.name
        cell.dateLabel.text = film.date
        cell.ratingLabel.text = "\(film.rating)"
        
        if film.rating > 7.0 {
            cell.ratingLabel.textColor = UIColor.green
        } else {
            if film.rating < 5.0 {
                cell.ratingLabel.textColor = UIColor.red
            } else {
                cell.ratingLabel.textColor = UIColor.black
            }
        }
    }
}
