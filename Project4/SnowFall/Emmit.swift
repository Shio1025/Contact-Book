//
//  Emmit.swift
//  Project4
//
//  Created by shio birbichadze on 12/23/21.
//  Copyright © 2021 shio birbichadze. All rights reserved.
//

import UIKit

class Emmit{
    
    static func create(with image:UIImage )-> CAEmitterLayer{
        let emitter=CAEmitterLayer()
        emitter.emitterShape=CAEmitterLayerEmitterShape.line
        emitter.emitterCells=generate(with:image  )
        
        
        
        return emitter
    }
    
    static func generate(with image:UIImage )->[CAEmitterCell]{
        var c=[CAEmitterCell]()
        
        
            let cell1=CAEmitterCell()
            cell1.contents = image.cgImage
            cell1.birthRate=10
            cell1.lifetime=55
            cell1.velocity = CGFloat(20)
            cell1.emissionLongitude = (180 * (.pi/180))
            cell1.emissionRange = (45 * (.pi/180))
            cell1.scale = 0.015
            cell1.scaleRange=0.01
            c.append(cell1)
        
            let cell2=CAEmitterCell()
            cell2.contents = image.cgImage
            cell2.birthRate=12
            cell2.lifetime=45
            cell2.velocity = CGFloat(25)
            cell2.emissionLongitude = (180 * (.pi/180))
            cell2.emissionRange = (135 * (.pi/180))
            cell2.scale = 0.01
            cell2.scaleRange=0.008
            c.append(cell2)
        
    
        return c
    }
    
    
}
