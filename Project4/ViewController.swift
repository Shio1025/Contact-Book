//
//  ViewController.swift
//  Project-4
//
//  Created by shio birbichadze on 12/23/21.
//  Copyright © 2021 shio birbichadze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var Assignment:UIButton!

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    
        snow()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
   
    
    
    
    func snow(){
        let i=UIImage(named: "snow.png")
        let emitter=Emmit.create(with: i!  )
        emitter.emitterPosition=CGPoint(x:self.view.bounds.size.width/2,y:-120)
        emitter.emitterSize=CGSize(width: 10, height: 10 )
        view.layer.addSublayer(emitter)
        
    }
    

    
    @IBAction func ViewAssignment(){
        let vc = storyboard?.instantiateViewController(withIdentifier : "NewViewController")
        navigationController?.setViewControllers([vc!], animated: true)
    
    }
    
}

