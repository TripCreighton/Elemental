//
//  MainTVC.swift
//  Elemental
//
//  Created by Trip Creighton on 2/27/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import UIKit

class MainTVC: UITableViewController {

    let elementList = ElementManager.shared.elementList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation back button:
        navigationController?.navigationBar.tintColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elementList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ElementCell", for: indexPath) as! ElementCell
//        cell.tintColor =
        let element = elementList[indexPath.row]
        cell.elementName.text = element.elementName
        cell.elementName.sizeToFit()
        cell.elementImage.image = element.image
        cell.elementImage.layer.borderColor = UIColor.white.cgColor
        cell.elementImage.layer.cornerRadius = 8
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ElementView" {
            let elementView = segue.destination as! ElementViewVC
            elementView.element = elementList[(tableView?.indexPathForSelectedRow?.row)!]
//            UIView.animate(withDuration: 0.1, animations: {
//                self.tableView.alpha = 0
//            })
        }
    }
 

}
