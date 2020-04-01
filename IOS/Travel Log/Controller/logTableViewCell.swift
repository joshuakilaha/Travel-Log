//
//  logTableViewCell.swift
//  Travel Log
//
//  Created by Kilz on 01/04/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import UIKit

class logTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var imageLocation: UIImageView!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func generateCell(_ logs: LogEntry) {
        let imageInURL = logs.image
        
        titleLable.text = logs.title
        descriptionTextView.text = logs.description
        
        // converting image url
        if let imageurl = URL(string: imageInURL) {
                   do {
                       let data  = try Data(contentsOf: imageurl)
                       self.imageLocation.image = UIImage(data: data)
                        //print("image Url Passed")
                       
                   } catch let err {
                       print("Error: \(err.localizedDescription)")
                   }
               }
        
    }

}
