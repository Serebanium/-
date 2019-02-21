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
    var insertMode = false
    
    override func viewDidLoad() {
        loadFilms()
        startUI()
    }
    
    func saveFilms() {
        
    }
    
    func loadFilms() {
        films = Film.load()
    }
    
    func startUI() {
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "info" {
            let controller = segue.destination as! ViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            controller.film = films[indexPath.row]
        }
        
        
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "save" else { return }
        guard let controller = segue.source as? EditTableViewController else { return }
        guard let film = controller.film else { return }
        
        if let selectedPath = tableView.indexPathForSelectedRow {
            films[selectedPath.row] = film
            tableView.reloadRows(at: [selectedPath], with: .automatic)
        } else {
            let indexPath = IndexPath(row: films.count, section: 0)
            films.append(film)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    }

