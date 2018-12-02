//
//  MainTableViewController.swift
//  RG2
//
//  Created by Anton on 30.11.2018.
//  Copyright © 2018 RubicsGuide. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

//    let mainMenuItem = ["Title 1", "Title 2", "Title 3"]
//
//    let restaurantNames = ["Ogonёk Grill&Bar", "Елу", "Bonsai", "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Respublica", "Speak Easy", "Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"]
//
//    let restaurantImages = ["ogonek.jpg", "elu.jpg", "bonsai.jpg", "dastarhan.jpg", "indokitay.jpg", "x.o.jpg", "balkan.jpg", "respublika.jpg", "speakeasy.jpg", "morris.jpg", "istorii.jpg", "klassik.jpg", "love.jpg", "shok.jpg", "bochka.jpg"]
    
    let lps = ListPagerLab.shared.listPagers
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lps.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        
        cell.titleTextView.text = lps[indexPath.row].title
        let imageName = lps[indexPath.row].image + ".pdf"
        cell.titleImageView.image = UIImage(named: imageName)
        
        return cell
    }
    
    func showAlert (index: Int) {
        let ac = UIAlertController(title: nil, message: "Выберите действие", preferredStyle: .actionSheet)
        //let call = UIAlertAction(title: "Позвонить: \(index)", style: .default, handler: nil)
        let call = UIAlertAction(title: "Позвонить: \(index)", style: .default) {
            (action: UIAlertAction) -> Void in
            let alertC = UIAlertController(title: nil, message: "Не могу позвонить", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertC.addAction(ok)
            self.present(alertC, animated: true, completion: nil)
        }
        
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        ac.addAction(cancel)
        ac.addAction(call)
        present (ac, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //showAlert(index: indexPath.row)
    }
    
}
