//
//  BoldspilVC.swift
//  DrinkingGameApp
//
//  Created by Peter & Liz  on 4/25/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

class BoldspilVC: UITableViewController {

    @IBAction func backButton(sender: AnyObject) {
        self.performSegueWithIdentifier("boldspilback", sender: self)
    }
    var boldspils = [Boldspil]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sample Data for Array
        
        self.boldspils = [Boldspil(category:"Boldspil", name:"Beerpong"),
            Boldspil(category:"Boldspil", name:"Gris"),
            Boldspil(category:"Boldspil", name:"Øl Bowling"),
            Boldspil(category:"Boldspil", name:"Øl Kroket"),
            Boldspil(category:"Boldspil", name:"Øl Pentanque")]
        
        // Reload the table
        
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if indexPath.row == 0
        {
            self.performSegueWithIdentifier("beerpong", sender: self)
        }
        else if indexPath.row == 1
        {
            self.performSegueWithIdentifier("gris", sender: self)
        }
        else if indexPath.row == 2
        {
            self.performSegueWithIdentifier("bowling", sender: self)
        }
        else if indexPath.row == 3
        {
            self.performSegueWithIdentifier("kroket", sender: self)
        }
        else if indexPath.row == 4
        {
            self.performSegueWithIdentifier("pentaque", sender: self)
        }
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.boldspils.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("boldspilcell", forIndexPath: indexPath) as! UITableViewCell
        
        // Get the corresponding terningspil from our terningspils array
        let boldspil = self.boldspils[indexPath.row]
        
        // Configure the cell
        cell.textLabel!.text = boldspil.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
}
