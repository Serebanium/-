//
//  FilmMO+init.swift
//  Кинопоиск
//
//  Created by Сергей Иванов on 24/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import CoreData

extension FilmMO {
    convenience init(_ film: Film) {
        
        
        
        self.init(context: AppDelegate.delegate!.context)
        name = film.name
        photo = film.photo.jpegData(compressionQuality: 1)
        notes = film.notes
        rating = film.rating
        date = film.date
        
    }
    
    static func fetch() -> [FilmMO]? {
        guard let delegate = AppDelegate.delegate else { return nil }
        
        let request: NSFetchRequest<FilmMO> = FilmMO.fetchRequest()
        let context = delegate.context
        
        let films: [FilmMO]?
        do {
            films = try context?.fetch(request)
        } catch {
            print(#function, error.localizedDescription)
            films = nil
        }
        return films
    }
    
    func removeFromCoreDataAndSaveContext() {
    guard let delegate = AppDelegate.delegate else { return }
    
    let context = delegate.context
    
    context?.delete(self)
    delegate.saveContext()
    }
}
