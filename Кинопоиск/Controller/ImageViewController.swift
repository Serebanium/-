//
//  ImageViewController.swift
//  Кинопоиск
//
//  Created by Сергей Иванов on 18/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        
        scrollView.minimumZoomScale = min(view.bounds.size.width /  imageView.bounds.width, view.bounds.size.height / imageView.bounds.height)
        
        scrollView.maximumZoomScale = 3
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

    
    

}
