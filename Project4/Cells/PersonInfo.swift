//
//  PersonInfo.swift
//  Project4
//
//  Created by shio birbichadze on 12/29/21.
//  Copyright © 2021 shio birbichadze. All rights reserved.
//

import UIKit

protocol ActionViewDelegate {
    func wasSelected(_ sender:PersonInfo )
}

class PersonInfo: UITableViewCell {
    
    @IBOutlet var star:UIButton!
    @IBOutlet var label1:UILabel!
    @IBOutlet var label2:UILabel!
    
    weak var info:Person?
    
    var s:Bool?=false
    var delegate: ActionViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

    }
    
    
    @IBAction func star_action(){
        
        if (s==false){
            
            star.setImage(UIImage(named: "star2"), for: .normal)
            s=true
            info?.star=true
            
        }else{
            star.setImage(UIImage(named: "star1"), for: .normal)
            s=false
            info?.star=false
           
        }
        
//        print(info?.star==true)
//        print(info?.name ?? "")
        
        self.delegate?.wasSelected(self)
    
    
    }
    
}
