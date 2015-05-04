//
//  TerningspilVC.swift
//  DrinkingGameApp
//
//  Created by Peter & Liz  on 4/25/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

class TerningspilVC: UITableViewController {
    
    @IBAction func backButton(sender: AnyObject) {
        self.performSegueWithIdentifier("terningspilback", sender: self)
    }
    var terningspils = [Terningspil]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sample Data for Array
        
        self.terningspils = [Terningspil(category:"Terningspil", name:"Det Tomme Glas"),
            Terningspil(category:"Terningspil", name:"Meyer"),
            Terningspil(category:"Terningspil", name:"Snyd"),
            Terningspil(category:"Terningspil", name:"Terningspillet"),
            Terningspil(category:"Terningspil", name:"Træmand"),
            Terningspil(category:"Terningspil", name:"100"),
            Terningspil(category:"Terningspil", name:"7/11"),]
        
        // Reload the table
        
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if indexPath.row == 0
        {
            self.performSegueWithIdentifier("det", sender: self)
        }
        else if indexPath.row == 1
        {
            self.performSegueWithIdentifier("meyer", sender: self)
        }
        else if indexPath.row == 2
        {
            self.performSegueWithIdentifier("snyd", sender: self)
        }
        else if indexPath.row == 3
        {
            self.performSegueWithIdentifier("terningspillet", sender: self)
        }
        else if indexPath.row == 4
        {
            self.performSegueWithIdentifier("trmand", sender: self)
        }
        else if indexPath.row == 5
        {
            self.performSegueWithIdentifier("100", sender: self)
        }
        else if indexPath.row == 6
        {
            self.performSegueWithIdentifier("7/11", sender: self)
        }
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.terningspils.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("terningspilcell", forIndexPath: indexPath) as! UITableViewCell
        
        // Get the corresponding terningspil from our terningspils array
        let terningspil = self.terningspils[indexPath.row]
        
        // Configure the cell
        cell.textLabel!.text = terningspil.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
}
