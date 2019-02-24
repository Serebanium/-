//
//  FilmViewController.swift
//  Кинопоиск
//
//  Created by Сергей Иванов on 13/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class FilmViewController: UITableViewController {

    //var films = [Film]()
    var filmsMO = [FilmMO]() {
        didSet {
            
            AppDelegate.delegate!.saveContext()
        }
    }
    var insertMode = false
    
    override func viewDidLoad() {
        
        AppDelegate.delegate!.saveContext()
        if let filmsMO = FilmMO.fetch() {
            self.filmsMO = filmsMO
        }
        startUI()
        
    }
    
    func saveFilms() {
        
    }
    
    func loadFilms() {
        
    }
    
    func startUI() {
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "info" {
            let controller = segue.destination as! ViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let filmMO = filmsMO[indexPath.row]
            controller.filmMO = filmMO
        }
        
        
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "save" else { return }
        guard let controller = segue.source as? EditTableViewController else { return }
        guard let filmMO = controller.filmMO else { return }
        
        if let selectedPath = tableView.indexPathForSelectedRow {
            filmsMO[selectedPath.row] = filmMO
            tableView.reloadRows(at: [selectedPath], with: .automatic)
        } else {
            let indexPath = IndexPath(row: filmsMO.count, section: 0)
            filmsMO.append(filmMO)
            tableView.insertRows(at: [indexPath], with: .automatic)
            
            
        }
       
        
        
    }
    
    }

