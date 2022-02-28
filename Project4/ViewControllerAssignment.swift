//
//  ViewController.swift
//  Project4
//
//  Created by shio birbichadze on 12/23/21.
//  Copyright © 2021 shio birbichadze. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerAssignment: UIViewController {
    
    var c=0
    @IBOutlet var data:UITableView!
    
    @IBOutlet var star:UIButton!
    
    var context=DBManager.shared.persistentContainer.viewContext
    

//    var favourites:[Family]=[]
    var surnames = [Family]() {
        didSet {
            data.reloadData()
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        data.delegate=self
        data.dataSource=self
        data.register(UINib(nibName: "PersonInfo",bundle:nil), forCellReuseIdentifier: "PersonInfo")
        
        fetchPeople()
        
    }

    
    func fetchPeople(){
        let request=Family.fetchRequest() as NSFetchRequest<Family>
        
        request.sortDescriptors = [NSSortDescriptor(key:("surname"),ascending:true)]
        
       
        do{
            surnames = try context.fetch(request)
            data.reloadData()
        }catch{
            fatalError("Failed to fetch contacts: \(error)")
        }
    }
    
//    private func myFilter(arr:[Family])->[Family]{
//        return arr.filter(){ family in
//
//            return getFav(family: family.members!).count>0
//
//        }
//    }
//
//    private func getFav(family:NSOrderedSet)->[Any]{
//        return family.filter(){ p  in
//            let person=p as! Person
//            return person.star==true
//
//        }
//
//
//    }
    
//
//    func fetchFavourites(){
//        let request=Family.fetchRequest() as NSFetchRequest<Family>
//
//
//        request.sortDescriptors = [NSSortDescriptor(key:("surname"),ascending:true)]
//
//
////        request.predicate=NSPredicate(format:"SUBQUERY(members,$g, $g.surname == %@)", "D")
//        do{
//            surnames = try context.fetch(request)
////            favourites=myFilter(arr: surnames)
////            print(favourites.count)
//////            for i in 0...favourites.count-1{
////////                print(surnames[i].members!)
//////
//////                for k in favourites[i].members!{
//////                    let person=k as! Person
//////                    if (person.star==false){
//////
//////
//////                        favourites[i].removeFromMembers(person)
//////
//////
//////
//////                    }
//////                }
//////            }
//            data.reloadData()
//
//        }catch{
//            fatalError("Failed to fetch favourites: \(error)")
//        }
//    }

    
    
    
    
    @IBAction func starAction(){
        if (c==0){
            
            star.setImage(UIImage(named: "star2"), for: .normal)
            c=1
            
        }else{
            c=0
            star.setImage(UIImage(named: "star1"), for: .normal)
            
        
            
        }
        fetchPeople()
    }
    
    @IBAction func add(){
        
        let alert = UIAlertController(title: "New Contact", message: nil, preferredStyle: .alert)
        
        var nameF:UITextField?
        var surnameF:UITextField?
        var num:UITextField?
        alert.addTextField{ textField in
            textField.placeholder="First name"
            nameF=textField
        }
        
        alert.addTextField{textField in
            textField.placeholder="Last name"
            surnameF=textField
        }
        alert.addTextField{textField in
            textField.placeholder=" Phone number"
            textField.keyboardType = .phonePad
            num=textField
            
        }
         alert.addAction(
            UIAlertAction(title: "Cancel",
                          style: .cancel,
                          handler: nil)
        )
        alert.addAction(
            UIAlertAction(title: "Save",
                          style: .default,
                          handler: {  [self] _ in

                            guard let nameF = nameF?.text else { return }
                            guard let surnameF = surnameF?.text else { return }
                            guard let num = num?.text else { return }
                        
                            let person=Person(context: self.context)
                            person.name=nameF
                            person.surname=surnameF
                            person.phoneNumber=num
                            person.star=false
                            
                            let f=surnameF.uppercased()
                            let tmp = String(f.first!)
                            if let family=self.surnames.first(where: {$0.surname==tmp}){
                                person.family = family
                            }else{
                                let family = Family(context: self.context)
                                family.surname = tmp
                                person.family = family
                                
                            }
                          
                            
                            do{
                               try self.context.save()
                                self.fetchPeople()
                            }catch{}
                        })
        )
        
        present(alert, animated: true, completion: nil)
        
    }
    


}



extension ViewControllerAssignment:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return surnames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.c==1){
            return surnames[section].favourites?.count ?? 0
        }
        return surnames[section].members?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let family=self.surnames[section]
        if (self.c==1){
            
            if let members = family.favourites{
                if members.count>0{
                    return family.surname?.description
                }
            }
        }else{
            
            if let members = family.members{
                if members.count>0{
                    return family.surname?.description
                }
            }
        }
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = data.dequeueReusableCell(withIdentifier: "PersonInfo", for: indexPath)
        if let PersonInfo=cell as? PersonInfo{
            if(self.c==0){
                if let p = surnames[indexPath.section].members?[indexPath.row] as? Person {
                    PersonInfo.delegate=self
                    PersonInfo.info = p
                    PersonInfo.label1.text=p.name
                    PersonInfo.label2.text=p.surname
                    PersonInfo.s = p.star
                    if(p.star == true){
                        PersonInfo.star.setImage(UIImage(named: "star2"), for: .normal)
                    }else{
                        PersonInfo.star.setImage(UIImage(named: "star1"), for: .normal)
                    }
                    
                }
            }else{
                
                if let p = surnames[indexPath.section].favourites?[indexPath.row] as? Person {
                    
                    PersonInfo.delegate=self
                    PersonInfo.info = p
                    PersonInfo.label1.text=p.name
                    PersonInfo.label2.text=p.surname
                    PersonInfo.s = p.star
                    PersonInfo.star.setImage(UIImage(named: "star2"), for: .normal)

                }
                
                
            }
            
        }
        
        return cell
    }
    
   
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(
            actions:[
                UIContextualAction(
                    style:.destructive,
                    title: "delete",
                    handler: {[self] _,_,_ in
                        if let person = self.surnames[indexPath.section].members?[indexPath.row] as? Person{
                            self.context.delete(person)
                        
                            do{
                                try self.context.save()
                                self.fetchPeople()
                            }catch{}
                        
                        }
                        
                })
        
                ]
        )
    }
    
    
}



extension ViewControllerAssignment:ActionViewDelegate{
    func wasSelected(_ sender: PersonInfo) {
//        print("hii")
        let f=sender.info?.surname!.uppercased()
        let tmp = String(f!.first!)
        let family=self.surnames.first(where: {$0.surname==tmp})
        if(sender.info?.star==true){
            sender.info?.favFamily=family
            
        }else{
            
            family?.removeFromFavourites(sender.info!)
        }
        do{
          try self.context.save()
           self.fetchPeople()
        }catch{}
    }




}
