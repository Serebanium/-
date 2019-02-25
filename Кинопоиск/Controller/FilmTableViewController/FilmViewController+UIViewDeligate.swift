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
           // let film = films[indexPath.row]
           // films.insert(film, at: indexPath.row)
            let filmMO = filmsMO[indexPath.row]
            filmsMO.insert(filmMO, at: indexPath.row)
            let delegate = AppDelegate.delegate!
            delegate.saveContext()
            tableView.insertRows(at: [indexPath], with: .top)
        case .delete:
            //films.remove(at: indexPath.row)
            let filmMO = filmsMO.remove(at: indexPath.row)
            let delegate = AppDelegate.delegate!
            let context = delegate.context
            context?.delete(filmMO)
            delegate.saveContext()
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .none:
            break
        }
        
    }
    
  
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
      //  let movedFilm = films.remove(at: sourceIndexPath.row)
       // films.insert(movedFilm, at: destinationIndexPath.row)
        let movedFilmMO = filmsMO.remove(at: sourceIndexPath.row)
        filmsMO.insert(movedFilmMO, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if !editing {insertMode.toggle()}
    }
    
    
    
}
