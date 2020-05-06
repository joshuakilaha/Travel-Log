//
//  ViewController.swift
//  Travel Log
//
//  Created by Kilz on 31/03/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     var logs: LogEntry!
  
    
    @IBOutlet weak var imageDestination: UIImageView!
    @IBOutlet weak var titleDestination: UILabel!
    
    @IBOutlet weak var ratingDestination: UILabel!
    
    @IBOutlet weak var descriptionDestination: UITextView!
    
    @IBOutlet weak var commentDestination: UITextView!

    @IBOutlet weak var datevisitedDestination: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        destinationViews()
        
        //print("the item", logs.description)
        
       
    
    }
    
    
    
    private func destinationViews() {
        
        if logs != nil {
            titleDestination.text = logs.title
            descriptionDestination.text = logs.description
            commentDestination.text = logs.comments
            //ratingDestination.text = logs.rating
            datevisitedDestination.text = logs.visitDate
            
             let imageInURL = logs.image
            if let imageurl = URL(string: imageInURL) {
                do {
                    let data  = try Data(contentsOf: imageurl)
                    self.imageDestination.image = UIImage(data: data)
                     //print("image Url Passed")
                    
                } catch let err {
                    print("Error: \(err.localizedDescription)")
                }
            }
        }
    }
    
    

}

