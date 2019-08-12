//
//  AddListViewController.swift
//  MemCards
//
//  Created by YS on 8/12/19.
//  Copyright © 2019 YS. All rights reserved.
//

import UIKit
import CoreData

class AddListViewController: UIViewController, UITextFieldDelegate {
    
    let doneButton = CustomButton()
    
    let closeButton = CustomButton()
    
    let textLabel = UILabel()
    
    let textField = UITextField()
    
    var cards: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        
        self.view.backgroundColor = .black
        
        textField.font = UIFont.boldSystemFont(ofSize: 17)
        textField.backgroundColor = .white
        textField.textColor = .black
        
        self.view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        textField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        textLabel.text = "The name of the cards"
        textLabel.textColor = .white
        textLabel.font = UIFont.boldSystemFont(ofSize: 21)
        
        self.view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        textLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -20).isActive = true
        
        
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.black, for: .normal)
        doneButton.backgroundColor = .white
        doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
        
        self.view.addSubview(doneButton)
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false;
        doneButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50).isActive = true;
        doneButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
        
        
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.black, for: .normal)
        closeButton.backgroundColor = .white
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        
        self.view.addSubview(closeButton)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false;
        closeButton.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 20).isActive = true;
        closeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func doneButtonAction() {
        guard textField.text != nil else { return }
        save(cardName: textField.text!)
        
        //        let vc = TableViewController()
        //        vc.cards = cards
        //        vc.tableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func closeButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func save(cardName: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Card", in: managedContext)!
        
        let card = NSManagedObject(entity: entity, insertInto: managedContext)
        
        card.setValue(cardName, forKey: "cardName")
        
        do {
            try managedContext.save()
            cards.append(card)
        } catch let error as NSError {
            print(error)
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
