//
//  AndetVC.swift
//  DrinkingGameApp
//
//  Created by Peter & Liz  on 4/25/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

class AndetVC: UITableViewController {
    
    @IBAction func backButton(sender: AnyObject) {
        self.performSegueWithIdentifier("andtback", sender: self)
    }
    
    var andets = [Andet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sample Data for Array
        
        self.andets = [Andet(category:"Andet", name:"Buffalo"),
            Andet(category:"Andet", name:"Fifa Druk"),
            Andet(category:"Andet", name:"Flip The Cup"),
            Andet(category:"Andet", name:"Gryde"),
            Andet(category:"Andet", name:"Jeg Har Aldrig"),
            Andet(category:"Andet", name:"Kapsel"),
            Andet(category:"Andet", name:"Kævle"),
            Andet(category:"Andet", name:"Quarters"),
            Andet(category:"Andet", name:"Stopur"),
            Andet(category:"Andet", name:"Søm"),
            Andet(category:"Andet", name:"Tid"),
            Andet(category:"Andet", name:"Øl Dart"),
            Andet(category:"Andet", name:"Øl Stafet")]
        
        // Reload the table
        
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if indexPath.row == 0
        {
            self.performSegueWithIdentifier("buffalo", sender: self)
        }
        else if indexPath.row == 1
        {
            self.performSegueWithIdentifier("fifa", sender: self)
        }
        else if indexPath.row == 2
        {
            self.performSegueWithIdentifier("flip", sender: self)
        }
        else if indexPath.row == 3
        {
            self.performSegueWithIdentifier("gryde", sender: self)
        }
        else if indexPath.row == 4
        {
            self.performSegueWithIdentifier("jeg", sender: self)
        }
        else if indexPath.row == 5
        {
            self.performSegueWithIdentifier("kapsel", sender: self)
        }
        else if indexPath.row == 6
        {
            self.performSegueWithIdentifier("kvle", sender: self)
        }
        else if indexPath.row == 7
        {
            self.performSegueWithIdentifier("quarters", sender: self)
        }
        else if indexPath.row == 8
        {
            self.performSegueWithIdentifier("stopur", sender: self)
        }
        else if indexPath.row == 9
        {
            self.performSegueWithIdentifier("sm", sender: self)
        }
        else if indexPath.row == 10
        {
            self.performSegueWithIdentifier("tid", sender: self)
        }
        else if indexPath.row == 11
        {
            self.performSegueWithIdentifier("dart", sender: self)
        }
        else if indexPath.row == 12
        {
            self.performSegueWithIdentifier("stafet", sender: self)
        }
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.andets.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("andetcell", forIndexPath: indexPath) as! UITableViewCell
        
        // Get the corresponding terningspil from our terningspils array
        let andet = self.andets[indexPath.row]
        
        // Configure the cell
        cell.textLabel!.text = andet.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    
    }
}

