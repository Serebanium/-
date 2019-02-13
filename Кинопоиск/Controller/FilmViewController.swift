//
//  FilmViewController.swift
//  Кинопоиск
//
//  Created by Сергей Иванов on 13/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class FilmViewController: UITableViewController {

    var films = [Film]()
    
    override func viewDidLoad() {
        loadFilms()
    }
    
    func saveFilms() {
        
    }
    
    func loadFilms() {
        films = Film.load()
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "info" else {return}
        
        let controller = segue.destination as! ViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        controller.film = films[indexPath.row]
    }
}
