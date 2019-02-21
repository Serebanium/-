//
//  FilmViewController+UIViewDeligate.swift
//  Кинопоиск
//
//  Created by Сергей Иванов on 21/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

extension FilmViewController {
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return insertMode ? .insert : .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch  editingStyle {
        case .insert:
            let film = films[indexPath.row]
            films.insert(film, at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .top)
        case .delete:
            films.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .none:
            break
        }
        
    }
    
  
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedFilm = films.remove(at: sourceIndexPath.row)
        films.insert(movedFilm, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if !editing {insertMode.toggle()}
    }
    
    
    
}
